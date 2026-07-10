import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../data/models/idoso.dart';
import '../../../shared/widgets/premium_upsell.dart';
import '../../avaliacao/presentation/convite_avaliacao.dart';
import '../../consultas/providers/consulta_providers.dart';
import '../../definicoes/presentation/definicoes_screen.dart';
import '../../idosos/presentation/idoso_detail_screen.dart';
import '../../idosos/presentation/idoso_form_screen.dart';
import '../../idosos/providers/idoso_providers.dart';
import '../../idosos/services/avisos_perfil.dart';
import '../../idosos/services/proximo_evento.dart';
import '../../medicacao/providers/medicacao_providers.dart';
import '../../relatorios/presentation/relatorio_screen.dart';
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
    final limites = ref.read(featureLimitsProvider);
    final limite = limites.maxPerfisIdoso;
    if (limite != null && totalAtual >= limite) {
      await mostrarLimiteAtingido(
        context,
        mensagem: 'O plano Grátis permite $limite ${limite == 1 ? 'perfil' : 'perfis'} de idoso. '
            'Subscreve o Premium para adicionares mais perfis.',
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
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Apagar perfil'),
        content: Text('Queres mesmo apagar o perfil de ${idoso.nome}?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancelar')),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Apagar')),
        ],
      ),
    );
    if (confirmar == true) {
      await ref.read(idosoRepositoryProvider).delete(idoso.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final idososAsync = ref.watch(idosoListProvider);
    final estadoSubscricao = ref.watch(estadoSubscricaoProvider).valueOrNull;

    return Scaffold(
      appBar: AppBar(
        title: const Text('CuidarPT', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          if (estadoSubscricao != null && estadoSubscricao.trialAtivo)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Center(
                child: Text(
                  'Trial: ${estadoSubscricao.diasRestantesTrial}d',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: 'Definições',
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
        error: (erro, stackTrace) => Center(child: Text('Erro ao carregar perfis: $erro')),
      ),
      floatingActionButton: idososAsync.maybeWhen(
        data: (idosos) => FloatingActionButton(
          onPressed: () => _adicionarIdoso(context, ref, idosos.length),
          tooltip: 'Adicionar perfil de idoso',
          child: const Icon(Icons.add),
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
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.elderly, size: 64, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 16),
            Text(
              'Ainda não tens nenhum perfil de idoso.\nToca no botão + para criar o primeiro.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class _LembreteHome {
  const _LembreteHome({required this.idoso, required this.evento});

  final Idoso idoso;
  final ProximoEvento evento;
}

const _maxLembretesVisiveis = 5;

/// Junta os próximos eventos (medicação/consultas) de todos os idosos numa
/// só lista, ordenada por proximidade, para uma visão rápida no ecrã
/// inicial — mesmo com vários perfis.
class _SeccaoLembretes extends ConsumerWidget {
  const _SeccaoLembretes({required this.idosos});

  final List<Idoso> idosos;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final agora = DateTime.now();
    final lembretes = <_LembreteHome>[];

    for (final idoso in idosos) {
      final medicacoes = ref.watch(medicacaoListProvider(idoso.id)).valueOrNull ?? const [];
      final consultas = ref.watch(consultaListProvider(idoso.id)).valueOrNull ?? const [];
      for (final evento in proximosEventos(agora, medicacoes: medicacoes, consultas: consultas)) {
        lembretes.add(_LembreteHome(idoso: idoso, evento: evento));
      }
    }
    lembretes.sort((a, b) => a.evento.dataHora.compareTo(b.evento.dataHora));
    final visiveis = lembretes.take(_maxLembretesVisiveis).toList();

    if (visiveis.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Card(
        child: ExpansionTile(
          initiallyExpanded: true,
          title: Text(
            'Lembretes',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('${visiveis.length} ${visiveis.length == 1 ? 'próximo' : 'próximos'}'),
          children: [
            for (final lembrete in visiveis)
              ListTile(
                dense: true,
                leading: Icon(
                  lembrete.evento.tipo == TipoProximoEvento.medicacao
                      ? Icons.medication_outlined
                      : Icons.event_note_outlined,
                ),
                title: Text(lembrete.evento.titulo),
                subtitle: Text(
                  '${lembrete.idoso.nome} · ${formatarContagem(agora, lembrete.evento.dataHora)}',
                ),
              ),
          ],
        ),
      ),
    );
  }
}

String _subtituloIdoso(Idoso idoso) {
  final dataNascimento = idoso.dataNascimento;
  if (dataNascimento == null) return 'Data de nascimento não definida';
  return 'Nascimento: ${DateFormat('dd/MM/yyyy').format(dataNascimento)}';
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
    final fotoPath = idoso.fotoPath;
    final avisos = avisosPerfilIncompleto(idoso);
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
            child: Row(
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
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              idoso.nome,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (avisos.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Tooltip(
                                message: avisos.join('\n'),
                                child: Icon(
                                  Icons.warning_amber_rounded,
                                  size: 18,
                                  color: Colors.amber.shade800,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(_subtituloIdoso(idoso), style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => RelatorioScreen(idoso: idoso)),
                  ),
                  icon: const Icon(Icons.picture_as_pdf_outlined),
                  tooltip: 'Gerar relatório',
                ),
                IconButton(
                  onPressed: onApagar,
                  icon: const Icon(Icons.delete_outline),
                  tooltip: 'Apagar perfil',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
