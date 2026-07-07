import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/photo_storage.dart';
import '../../../data/models/idoso.dart';
import '../../../shared/widgets/premium_upsell.dart';
import '../../avaliacao/presentation/convite_avaliacao.dart';
import '../../consultas/providers/consulta_providers.dart';
import '../../contactos_cuidadores/providers/contacto_cuidador_providers.dart';
import '../../cuidados_diarios/providers/cuidado_diario_providers.dart';
import '../../medicacao/providers/medicacao_providers.dart';
import '../../subscricao/feature_limits.dart';
import '../providers/perfil_relatorio_providers.dart';
import '../services/periodo_relatorio.dart';
import '../services/relatorio_pdf_builder.dart';
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
  final opcoes = <String, String>{
    if (emailProprio != null && emailProprio.isNotEmpty) emailProprio: 'Eu mesmo ($emailProprio)',
    for (final email in emailsContactos) email: email,
  };
  if (opcoes.length < 2) return opcoes.keys.toList();

  final selecionados = {...opcoes.keys};
  final resultado = await showDialog<Set<String>>(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setStateDialog) => AlertDialog(
        title: const Text('Partilhar com quem?'),
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
            child: const Text('Nenhum'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(selecionados),
            child: const Text('Continuar'),
          ),
        ],
      ),
    ),
  );
  return (resultado ?? selecionados).toList();
}

class RelatorioScreen extends ConsumerStatefulWidget {
  const RelatorioScreen({super.key, required this.idoso});

  final Idoso idoso;

  @override
  ConsumerState<RelatorioScreen> createState() => _RelatorioScreenState();
}

class _RelatorioScreenState extends ConsumerState<RelatorioScreen> {
  final _cuidadorNomeController = TextEditingController();

  PeriodoRelatorio _periodo = PeriodoRelatorio.ultimos7Dias;
  DateTimeRange? _intervaloPersonalizado;
  String? _logoPath;
  bool _perfilCarregado = false;
  bool _aGerar = false;

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
    if (!permitido) {
      await mostrarLimiteAtingido(
        context,
        mensagem: 'Escolher um período personalizado é uma funcionalidade Premium. '
            'No plano Grátis, tens os últimos 7 ou 30 dias.',
      );
      return;
    }
    final agora = DateTime.now();
    final intervalo = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: agora,
      initialDateRange: _intervaloPersonalizado,
      helpText: 'Período do relatório',
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
        mensagem: 'Personalizar o relatório com logótipo é uma funcionalidade Premium.',
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
              idoso: widget.idoso,
              inicio: intervalo.inicio,
              fim: intervalo.fim,
              medicacoesAtivas: medicacoes,
              consultas: consultas,
              cuidados: cuidados,
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
    final limites = ref.watch(featureLimitsProvider);
    final intervalo = _calcularIntervalo();

    return Scaffold(
      appBar: AppBar(title: const Text('Gerar relatório')),
      body: ListView(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + MediaQuery.of(context).padding.bottom),
        children: [
          Text('Período', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              ChoiceChip(
                label: const Text('Últimos 7 dias'),
                selected: _periodo == PeriodoRelatorio.ultimos7Dias,
                onSelected: (_) => setState(() => _periodo = PeriodoRelatorio.ultimos7Dias),
              ),
              ChoiceChip(
                label: const Text('Últimos 30 dias'),
                selected: _periodo == PeriodoRelatorio.ultimos30Dias,
                onSelected: (_) => setState(() => _periodo = PeriodoRelatorio.ultimos30Dias),
              ),
              ChoiceChip(
                avatar: limites.permiteHistoricoIlimitado ? null : const Icon(Icons.star_outline, size: 16),
                label: const Text('Período personalizado'),
                selected: _periodo == PeriodoRelatorio.personalizado,
                onSelected: (_) => _selecionarPersonalizado(limites.permiteHistoricoIlimitado),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '${DateFormat('dd/MM/yyyy').format(intervalo.inicio)} a '
            '${DateFormat('dd/MM/yyyy').format(intervalo.fim)}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(child: Text('Personalização', style: Theme.of(context).textTheme.titleMedium)),
              if (!limites.permitePdfPersonalizado) const Icon(Icons.star_outline, size: 18),
            ],
          ),
          const SizedBox(height: 8),
          if (!_perfilCarregado)
            const Center(child: CircularProgressIndicator())
          else if (!limites.permitePdfPersonalizado)
            Text(
              'Adicionar o teu nome e logótipo ao relatório é uma funcionalidade Premium.',
              style: Theme.of(context).textTheme.bodySmall,
            )
          else ...[
            TextFormField(
              controller: _cuidadorNomeController,
              decoration: const InputDecoration(labelText: 'Nome do cuidador profissional (opcional)'),
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
                  child: Text(_logoPath == null ? 'Adicionar logótipo' : 'Alterar logótipo'),
                ),
              ],
            ),
          ],
          const SizedBox(height: 32),
          FilledButton.icon(
            onPressed: _aGerar ? null : () => _gerarRelatorio(limites.permitePdfPersonalizado),
            icon: _aGerar
                ? const SizedBox(height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2))
                : const Icon(Icons.picture_as_pdf_outlined),
            label: const Text('Gerar relatório'),
          ),
        ],
      ),
    );
  }
}
