import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../data/models/idoso.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/widgets/gradiente_premium.dart';
import '../../../shared/widgets/logo_app.dart';
import '../../../shared/widgets/premium_upsell.dart';
import '../../avaliacao/presentation/convite_avaliacao.dart';
import '../../consultas/presentation/consulta_form_screen.dart';
import '../../consultas/providers/consulta_providers.dart';
import '../../definicoes/presentation/definicoes_screen.dart';
import '../../idosos/presentation/idoso_detail_screen.dart';
import '../../idosos/presentation/idoso_form_screen.dart';
import '../../idosos/providers/idoso_providers.dart';
import '../../idosos/services/proximo_evento.dart';
import '../../medicacao/presentation/medicacao_form_screen.dart';
import '../../medicacao/providers/medicacao_providers.dart';
import '../../relatorios/presentation/relatorio_screen.dart';
import '../../sinais_vitais/presentation/sinais_vitais_form_screen.dart';
import '../../subscricao/feature_limits.dart';
import '../../subscricao/providers/subscricao_providers.dart';

class HomeShellScreen extends ConsumerStatefulWidget {
  const HomeShellScreen({super.key});

  @override
  ConsumerState<HomeShellScreen> createState() => _HomeShellScreenState();
}

class _HomeShellScreenState extends ConsumerState<HomeShellScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) mostrarConviteAvaliacaoSeNecessario(context, ref);
    });
  }

  Future<void> _adicionarIdoso(BuildContext context, WidgetRef ref, int totalAtual) async {
    final l10n = AppLocalizations.of(context);
    final limites = ref.read(featureLimitsProvider);
    final limite = limites.maxPerfisIdoso;
    if (limite != null && totalAtual >= limite) {
      await mostrarLimiteAtingido(
        context,
        mensagem: l10n.homeLimiteIdososMensagem(limite),
      );
      return;
    }
    if (context.mounted) {
      await Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const IdosoFormScreen()),
      );
    }
  }

  Future<void> _apagarIdoso(BuildContext context, WidgetRef ref, Idoso idoso) async {
    final l10n = AppLocalizations.of(context);
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.homeApagarPerfilTitulo),
        content: Text(l10n.homeApagarPerfilConfirmacao(idoso.nome)),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text(l10n.comumCancelar)),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: Text(l10n.comumApagar)),
        ],
      ),
    );
    if (confirmar == true) {
      await ref.read(idosoRepositoryProvider).delete(idoso.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final idososAsync = ref.watch(idosoListProvider);
    final estadoSubscricao = ref.watch(estadoSubscricaoProvider).valueOrNull;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 88,
        title: Semantics(label: 'CuidarPT', child: const LogoApp(size: 72)),
        actions: [
          if (estadoSubscricao != null && estadoSubscricao.trialAtivo)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Center(
                child: Text(
                  l10n.homeTrialDias(estadoSubscricao.diasRestantesTrial),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: l10n.comumDefinicoes,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const DefinicoesScreen()),
            ),
          ),
        ],
      ),
      body: idososAsync.when(
        data: (idosos) {
          if (idosos.isEmpty) {
            return const _EmptyState();
          }
          return ListView(
            children: [
              _AcessoRapidoGlobal(idosos: idosos),
              _SeccaoLembretes(idosos: idosos),
              for (var indice = 0; indice < idosos.length; indice++)
                _IdosoCardDestacado(
                  idoso: idosos[indice],
                  idosos: idosos,
                  indice: indice,
                  onApagar: () => _apagarIdoso(context, ref, idosos[indice]),
                ),
              const SizedBox(height: 8),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (erro, stackTrace) => Center(child: Text(l10n.homeErroCarregarPerfis('$erro'))),
      ),
      bottomNavigationBar: idososAsync.maybeWhen(
        data: (idosos) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                icon: const Icon(Icons.add),
                label: Text(l10n.homeCriarNovoPerfil),
                onPressed: () => _adicionarIdoso(context, ref, idosos.length),
              ),
            ),
          ),
        ),
        orElse: () => null,
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.elderly, size: 64, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 16),
            Text(
              l10n.homeEmptyStateTexto,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

const _maxLembretesPorIdoso = 3;

/// Mostra os próximos eventos (medicação/consultas) de cada idoso, agrupados
/// por idoso (não misturados), para uma visão rápida no ecrã inicial —
/// mesmo com vários perfis. Os mais próximos ficam destacados a vermelho.
class _SeccaoLembretes extends ConsumerWidget {
  const _SeccaoLembretes({required this.idosos});

  final List<Idoso> idosos;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final agora = DateTime.now();
    final porIdoso = <(Idoso, List<ProximoEvento>)>[];
    var total = 0;

    for (final idoso in idosos) {
      final medicacoes = ref.watch(medicacaoListProvider(idoso.id)).valueOrNull ?? const [];
      final consultas = ref.watch(consultaListProvider(idoso.id)).valueOrNull ?? const [];
      final eventos = proximosEventos(agora, medicacoes: medicacoes, consultas: consultas);
      if (eventos.isEmpty) continue;
      final visiveis = eventos.take(_maxLembretesPorIdoso).toList();
      porIdoso.add((idoso, visiveis));
      total += visiveis.length;
    }

    if (porIdoso.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Card(
        child: ExpansionTile(
          initiallyExpanded: false,
          title: GradientText(
            l10n.homeLembretesTitulo,
            glow: true,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(l10n.homeLembretesContagem(total)),
          children: [
            for (final (idoso, eventos) in porIdoso) ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                child: Text(
                  idoso.nome,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              for (final evento in eventos) _LembreteTile(idoso: idoso, agora: agora, evento: evento),
            ],
          ],
        ),
      ),
    );
  }
}

class _LembreteTile extends StatelessWidget {
  const _LembreteTile({required this.idoso, required this.agora, required this.evento});

  final Idoso idoso;
  final DateTime agora;
  final ProximoEvento evento;

  void _abrirRegisto(BuildContext context) {
    final medicacao = evento.medicacao;
    final consulta = evento.consulta;
    if (medicacao != null) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => MedicacaoFormScreen(idoso: idoso, registo: medicacao)),
      );
    } else if (consulta != null) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => ConsultaFormScreen(idoso: idoso, consulta: consulta)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final urgente = eventoUrgente(agora, evento.dataHora);
    final cor = urgente ? Colors.red.shade700 : null;
    final peso = urgente ? FontWeight.bold : null;
    return ListTile(
      dense: true,
      leading: Icon(
        evento.tipo == TipoProximoEvento.medicacao ? Icons.medication_outlined : Icons.event_note_outlined,
        color: cor,
      ),
      title: Text(evento.titulo, style: TextStyle(color: cor, fontWeight: peso)),
      subtitle:
          Text(formatarContagem(l10n, agora, evento.dataHora), style: TextStyle(color: cor, fontWeight: peso)),
      onTap: () => _abrirRegisto(context),
    );
  }
}

String _subtituloIdoso(AppLocalizations l10n, Idoso idoso) {
  final dataNascimento = idoso.dataNascimento;
  if (dataNascimento == null) return l10n.homeIdosoSemDataNascimento;
  return l10n.homeIdosoDataNascimento(DateFormat('dd/MM/yyyy').format(dataNascimento));
}

class _IdosoCardDestacado extends StatelessWidget {
  const _IdosoCardDestacado({
    required this.idoso,
    required this.idosos,
    required this.indice,
    required this.onApagar,
  });

  final Idoso idoso;
  final List<Idoso> idosos;
  final int indice;
  final VoidCallback onApagar;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final fotoPath = idoso.fotoPath;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => IdosoDetailScreen(idosos: idosos, indiceInicial: indice),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundImage: fotoPath != null ? FileImage(File(fotoPath)) : null,
                          child: fotoPath == null ? const Icon(Icons.elderly, size: 28) : null,
                        ),
                        if (idoso.mobilidadeReduzida)
                          Positioned(
                            right: -2,
                            bottom: -2,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Theme.of(context).colorScheme.primary,
                              child: const Icon(Icons.accessible, color: Colors.white, size: 14),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            idoso.nome,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(_subtituloIdoso(l10n, idoso), style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: onApagar,
                      icon: const Icon(Icons.delete_outline),
                      tooltip: l10n.homeApagarPerfilTitulo,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Pergunta a qual idoso uma ação rápida global se refere. Com um único
/// idoso, avança logo sem perguntar.
Future<Idoso?> _escolherIdosoParaAcao(BuildContext context, List<Idoso> idosos) {
  if (idosos.length == 1) return Future.value(idosos.first);
  final l10n = AppLocalizations.of(context);
  return showModalBottomSheet<Idoso>(
    context: context,
    builder: (context) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(l10n.homeEscolherIdosoTitulo, style: Theme.of(context).textTheme.titleMedium),
          ),
          for (final idoso in idosos)
            ListTile(
              leading: CircleAvatar(
                backgroundImage: idoso.fotoPath != null ? FileImage(File(idoso.fotoPath!)) : null,
                child: idoso.fotoPath == null ? const Icon(Icons.elderly) : null,
              ),
              title: Text(idoso.nome),
              onTap: () => Navigator.of(context).pop(idoso),
            ),
        ],
      ),
    ),
  );
}

/// Caixas de acesso rápido globais no topo do ecrã inicial (em vez de uma
/// fila pequena dentro de cada cartão de idoso): tocar pergunta a qual
/// idoso a ação se refere (ou avança logo, se só houver um).
class _AcessoRapidoGlobal extends ConsumerWidget {
  const _AcessoRapidoGlobal({required this.idosos});

  final List<Idoso> idosos;

  Future<void> _abrirMedicacao(BuildContext context) async {
    final idoso = await _escolherIdosoParaAcao(context, idosos);
    if (idoso == null || !context.mounted) return;
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => MedicacaoFormScreen(idoso: idoso)),
    );
  }

  Future<void> _abrirConsulta(BuildContext context) async {
    final idoso = await _escolherIdosoParaAcao(context, idosos);
    if (idoso == null || !context.mounted) return;
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => ConsultaFormScreen(idoso: idoso)),
    );
  }

  Future<void> _abrirSinaisVitais(BuildContext context, WidgetRef ref) async {
    final idoso = await _escolherIdosoParaAcao(context, idosos);
    if (idoso == null || !context.mounted) return;
    if (!ref.read(featureLimitsProvider).permiteSinaisVitais) {
      await mostrarLimiteAtingido(
        context,
        mensagem: AppLocalizations.of(context).comumSinaisVitaisPremiumMensagem,
      );
      return;
    }
    if (!context.mounted) return;
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => SinaisVitaisFormScreen(idoso: idoso)),
    );
  }

  Future<void> _abrirRelatorio(BuildContext context) async {
    final idoso = await _escolherIdosoParaAcao(context, idosos);
    if (idoso == null || !context.mounted) return;
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => RelatorioScreen(idoso: idoso)),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.7,
        children: [
          _AcaoRapidaGrande(
            icon: Icons.medication_outlined,
            rotulo: l10n.homeAcaoMedicacao,
            onPressed: () => _abrirMedicacao(context),
          ),
          _AcaoRapidaGrande(
            icon: Icons.event_note_outlined,
            rotulo: l10n.homeAcaoConsulta,
            onPressed: () => _abrirConsulta(context),
          ),
          _AcaoRapidaGrande(
            icon: Icons.monitor_heart_outlined,
            rotulo: l10n.homeAcaoSinaisVitais,
            onPressed: () => _abrirSinaisVitais(context, ref),
          ),
          _AcaoRapidaGrande(
            icon: Icons.picture_as_pdf_outlined,
            rotulo: l10n.homeAcaoRelatorio,
            destacarGradiente: true,
            onPressed: () => _abrirRelatorio(context),
          ),
        ],
      ),
    );
  }
}

class _AcaoRapidaGrande extends StatelessWidget {
  const _AcaoRapidaGrande({
    required this.icon,
    required this.rotulo,
    required this.onPressed,
    this.destacarGradiente = false,
  });

  final IconData icon;
  final String rotulo;
  final VoidCallback onPressed;
  final bool destacarGradiente;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              destacarGradiente
                  ? GradientIcon(icon, size: 34)
                  : Icon(icon, color: Theme.of(context).colorScheme.onPrimaryContainer, size: 34),
              const SizedBox(height: 8),
              destacarGradiente
                  ? GradientText(
                      rotulo,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                    )
                  : Text(
                      rotulo,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

