import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/photo_storage.dart';
import '../../../data/models/idoso.dart';
import '../../../data/models/registo_sinais_vitais.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/widgets/gradiente_premium.dart';
import '../../../shared/widgets/premium_upsell.dart';
import '../../avaliacao/presentation/convite_avaliacao.dart';
import '../../consultas/providers/consulta_providers.dart';
import '../../contactos_cuidadores/providers/contacto_cuidador_providers.dart';
import '../../cuidados_diarios/providers/cuidado_diario_providers.dart';
import '../../medicacao/providers/medicacao_providers.dart';
import '../../sinais_vitais/providers/sinais_vitais_providers.dart';
import '../../subscricao/feature_limits.dart';
import '../providers/perfil_relatorio_providers.dart';
import '../services/periodo_relatorio.dart';
import '../services/relatorio_pdf_builder.dart';
import '../services/seccoes_relatorio.dart';
import 'relatorio_preview_screen.dart';

/// Se houver 2 ou mais destinatários possíveis (o próprio email do
/// onboarding + contactos de cuidadores guardados), deixa escolher quais
/// pré-preencher ao partilhar. Com 0 ou 1 disponíveis, não interrompe o
/// fluxo — usa-os automaticamente.
Future<List<String>> _escolherDestinatarios(
  BuildContext context, {
  required String? emailProprio,
  required List<String> emailsContactos,
}) async {
  final l10n = AppLocalizations.of(context);
  final opcoes = <String, String>{
    if (emailProprio != null && emailProprio.isNotEmpty) emailProprio: l10n.relatorioEuMesmo(emailProprio),
    for (final email in emailsContactos) email: email,
  };
  if (opcoes.length < 2) return opcoes.keys.toList();

  final selecionados = {...opcoes.keys};
  final resultado = await showDialog<Set<String>>(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setStateDialog) => AlertDialog(
        title: Text(l10n.relatorioPartilharTitulo),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView(
            shrinkWrap: true,
            children: [
              for (final entry in opcoes.entries)
                CheckboxListTile(
                  title: Text(entry.value),
                  value: selecionados.contains(entry.key),
                  onChanged: (marcado) => setStateDialog(() {
                    if (marcado == true) {
                      selecionados.add(entry.key);
                    } else {
                      selecionados.remove(entry.key);
                    }
                  }),
                ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(<String>{}),
            child: Text(l10n.relatorioNenhum),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(selecionados),
            child: Text(l10n.relatorioContinuar),
          ),
        ],
      ),
    ),
  );
  return (resultado ?? selecionados).toList();
}

class RelatorioScreen extends ConsumerStatefulWidget {
  const RelatorioScreen({super.key, required this.idoso, this.periodoInicial = PeriodoRelatorio.ultimos7Dias});

  final Idoso idoso;

  /// Período pré-selecionado ao abrir o ecrã (ex.: [PeriodoRelatorio.hoje]
  /// quando se acede pelo botão de relatório diário).
  final PeriodoRelatorio periodoInicial;

  @override
  ConsumerState<RelatorioScreen> createState() => _RelatorioScreenState();
}

class _RelatorioScreenState extends ConsumerState<RelatorioScreen> {
  final _cuidadorNomeController = TextEditingController();

  late PeriodoRelatorio _periodo = widget.periodoInicial;
  DateTimeRange? _intervaloPersonalizado;
  String? _logoPath;
  bool _perfilCarregado = false;
  bool _aGerar = false;
  final _seccoes = Set<SeccaoRelatorio>.from(SeccaoRelatorio.values);

  @override
  void initState() {
    super.initState();
    _carregarPerfil();
  }

  @override
  void dispose() {
    _cuidadorNomeController.dispose();
    super.dispose();
  }

  Future<void> _carregarPerfil() async {
    final perfil = await ref.read(perfilRelatorioRepositoryProvider).obterAtual();
    if (!mounted) return;
    setState(() {
      _cuidadorNomeController.text = perfil.cuidadorNome ?? '';
      _logoPath = perfil.logoPath;
      _perfilCarregado = true;
    });
  }

  ({DateTime inicio, DateTime fim}) _calcularIntervalo() {
    return calcularIntervaloRelatorio(_periodo, personalizado: _intervaloPersonalizado);
  }

  Future<void> _selecionarPersonalizado(bool permitido) async {
    final l10n = AppLocalizations.of(context);
    if (!permitido) {
      await mostrarLimiteAtingido(
        context,
        mensagem: l10n.relatorioPeriodoPersonalizadoUpsell,
      );
      return;
    }
    final agora = DateTime.now();
    final intervalo = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: agora,
      initialDateRange: _intervaloPersonalizado,
      helpText: l10n.relatorioPeriodoHelpText,
    );
    if (intervalo != null) {
      setState(() {
        _periodo = PeriodoRelatorio.personalizado;
        _intervaloPersonalizado = intervalo;
      });
    }
  }

  Future<void> _escolherLogo(bool permitido) async {
    if (!permitido) {
      await mostrarLimiteAtingido(
        context,
        mensagem: AppLocalizations.of(context).relatorioLogoUpsell,
      );
      return;
    }
    final ficheiro = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 85);
    if (ficheiro == null || !mounted) return;
    final caminhoAnterior = _logoPath;
    final caminhoGuardado = await PhotoStorage.guardarLogoRelatorio(File(ficheiro.path));
    if (!mounted) return;
    setState(() => _logoPath = caminhoGuardado);
    await PhotoStorage.apagarFoto(caminhoAnterior);
  }

  Future<void> _guardarPerfilRelatorio() async {
    final nome = _cuidadorNomeController.text.trim();
    await ref.read(perfilRelatorioRepositoryProvider).guardar(
          cuidadorNome: nome.isEmpty ? null : nome,
          logoPath: _logoPath,
        );
  }

  Future<void> _gerarRelatorio(bool permitePersonalizacao) async {
    final l10n = AppLocalizations.of(context);
    setState(() => _aGerar = true);
    try {
      if (permitePersonalizacao) {
        await _guardarPerfilRelatorio();
      }

      final intervalo = _calcularIntervalo();
      final medicacoes =
          await ref.read(registoMedicacaoRepositoryProvider).listarAtivosPorIdoso(widget.idoso.id);
      final consultas = await ref.read(registoConsultaRepositoryProvider).listarPorIdosoEPeriodo(
            widget.idoso.id,
            inicio: intervalo.inicio,
            fim: intervalo.fim,
          );
      final cuidados = await ref.read(registoCuidadoDiarioRepositoryProvider).listarPorIdosoEPeriodo(
            widget.idoso.id,
            inicio: intervalo.inicio,
            fim: intervalo.fim,
          );
      final sinaisVitais = _seccoes.contains(SeccaoRelatorio.sinaisVitais)
          ? await ref.read(registoSinaisVitaisRepositoryProvider).listarPorIdosoEPeriodo(
                widget.idoso.id,
                inicio: intervalo.inicio,
                fim: intervalo.fim,
              )
          : const <RegistoSinaisVitais>[];

      final cuidadorNome = permitePersonalizacao ? _cuidadorNomeController.text.trim() : null;
      Uint8List? logoBytes;
      if (permitePersonalizacao && _logoPath != null) {
        logoBytes = await File(_logoPath!).readAsBytes();
      }

      final perfil = await ref.read(perfilRelatorioRepositoryProvider).obterAtual();
      final contactos = await ref.read(contactoCuidadorListProvider.future);
      if (!mounted) return;
      final emailsPartilha = await _escolherDestinatarios(
        context,
        emailProprio: perfil.cuidadorEmail,
        emailsContactos: contactos.map((c) => c.email).toList(),
      );

      if (!mounted) return;
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => RelatorioPreviewScreen(
            nomeFicheiro: 'relatorio_${widget.idoso.nome.replaceAll(' ', '_')}.pdf',
            emailsPartilha: emailsPartilha,
            gerarPdf: (_) => RelatorioPdfBuilder.construir(
              l10n: l10n,
              idoso: widget.idoso,
              inicio: intervalo.inicio,
              fim: intervalo.fim,
              medicacoesAtivas: medicacoes,
              consultas: consultas,
              cuidados: cuidados,
              sinaisVitais: sinaisVitais,
              seccoes: _seccoes,
              cuidadorNome: cuidadorNome,
              logoBytes: logoBytes,
            ),
          ),
        ),
      );

      if (mounted) {
        await mostrarConviteAvaliacaoSeNecessario(context, ref, forcar: true);
      }
    } finally {
      if (mounted) setState(() => _aGerar = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final limites = ref.watch(featureLimitsProvider);
    final intervalo = _calcularIntervalo();

    return Scaffold(
      appBar: AppBar(title: Text(l10n.relatorioTitulo)),
      body: ListView(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + MediaQuery.of(context).padding.bottom),
        children: [
          Text(l10n.relatorioPeriodoTitulo, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              ChoiceChip(
                label: Text(l10n.relatorioPeriodoHoje),
                selected: _periodo == PeriodoRelatorio.hoje,
                onSelected: (_) => setState(() => _periodo = PeriodoRelatorio.hoje),
              ),
              ChoiceChip(
                label: Text(l10n.relatorioPeriodoUltimos7Dias),
                selected: _periodo == PeriodoRelatorio.ultimos7Dias,
                onSelected: (_) => setState(() => _periodo = PeriodoRelatorio.ultimos7Dias),
              ),
              ChoiceChip(
                label: Text(l10n.relatorioPeriodoUltimos30Dias),
                selected: _periodo == PeriodoRelatorio.ultimos30Dias,
                onSelected: (_) => setState(() => _periodo = PeriodoRelatorio.ultimos30Dias),
              ),
              ChoiceChip(
                avatar: limites.permiteHistoricoIlimitado ? null : const Icon(Icons.star_outline, size: 16),
                label: Text(l10n.relatorioPeriodoPersonalizado),
                selected: _periodo == PeriodoRelatorio.personalizado,
                onSelected: (_) => _selecionarPersonalizado(limites.permiteHistoricoIlimitado),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            l10n.relatorioIntervalo(
              DateFormat('dd/MM/yyyy').format(intervalo.inicio),
              DateFormat('dd/MM/yyyy').format(intervalo.fim),
            ),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 24),
          Text(
            l10n.relatorioSeccoesTitulo,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            l10n.relatorioSeccoesDescricao,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          for (final seccao in SeccaoRelatorio.values)
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              value: _seccoes.contains(seccao),
              title: Text(labelSeccaoRelatorio(l10n, seccao)),
              onChanged: (marcado) => setState(() {
                if (marcado == true) {
                  _seccoes.add(seccao);
                } else {
                  _seccoes.remove(seccao);
                }
              }),
            ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(child: Text(l10n.relatorioPersonalizacaoTitulo, style: Theme.of(context).textTheme.titleMedium)),
              if (!limites.permitePdfPersonalizado) const Icon(Icons.star_outline, size: 18),
            ],
          ),
          const SizedBox(height: 8),
          if (!_perfilCarregado)
            const Center(child: CircularProgressIndicator())
          else if (!limites.permitePdfPersonalizado)
            Text(
              l10n.relatorioPersonalizacaoUpsell,
              style: Theme.of(context).textTheme.bodySmall,
            )
          else ...[
            TextFormField(
              controller: _cuidadorNomeController,
              decoration: InputDecoration(labelText: l10n.relatorioNomeCuidador),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: _logoPath != null ? FileImage(File(_logoPath!)) : null,
                  child: _logoPath == null ? const Icon(Icons.image_outlined) : null,
                ),
                const SizedBox(width: 12),
                TextButton(
                  onPressed: () => _escolherLogo(limites.permitePdfPersonalizado),
                  child: Text(_logoPath == null ? l10n.relatorioAdicionarLogo : l10n.relatorioAlterarLogo),
                ),
              ],
            ),
          ],
          const SizedBox(height: 32),
          FilledButton.icon(
            onPressed: _aGerar ? null : () => _gerarRelatorio(limites.permitePdfPersonalizado),
            icon: _aGerar
                ? const SizedBox(height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2))
                : const GradientIcon(Icons.picture_as_pdf_outlined),
            label: GradientText(l10n.relatorioGerarBotao, style: const TextStyle(fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
