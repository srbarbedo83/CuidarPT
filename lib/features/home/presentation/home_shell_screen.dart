import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../data/models/idoso.dart';
import '../../../shared/widgets/gradiente_premium.dart';
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
        centerTitle: true,
        title: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'store_assets/icone_play_store_512x512.png',
            height: 36,
            width: 36,
            semanticLabel: 'CuidarPT',
          ),
        ),
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

const _maxLembretesPorIdoso = 3;

/// Mostra os próximos eventos (medicação/consultas) de cada idoso, agrupados
/// por idoso (não misturados), para uma visão rápida no ecrã inicial —
/// mesmo com vários perfis. Os mais próximos ficam destacados a vermelho.
class _SeccaoLembretes extends ConsumerWidget {
  const _SeccaoLembretes({required this.idosos});

  final List<Idoso> idosos;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          initiallyExpanded: true,
          title: Text(
            'Lembretes',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('$total ${total == 1 ? 'próximo' : 'próximos'}'),
          children: [
            for (final (idoso, eventos) in porIdoso) ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                child: Text(
                  idoso.nome,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              for (final evento in eventos) _LembreteTile(agora: agora, evento: evento),
            ],
          ],
        ),
      ),
    );
  }
}

class _LembreteTile extends StatelessWidget {
  const _LembreteTile({required this.agora, required this.evento});

  final DateTime agora;
  final ProximoEvento evento;

  @override
  Widget build(BuildContext context) {
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
      subtitle: Text(formatarContagem(agora, evento.dataHora), style: TextStyle(color: cor, fontWeight: peso)),
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
                          Text(_subtituloIdoso(idoso), style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: onApagar,
                      icon: const Icon(Icons.delete_outline),
                      tooltip: 'Apagar perfil',
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _AcoesRapidasIdoso(idoso: idoso),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Fila de ações rápidas do idoso (registar/consultar sem abrir o perfil
/// inteiro), no mesmo espírito simples e direto de outras apps de cuidados:
/// um ícone com rótulo por baixo, que leva logo ao formulário certo.
class _AcoesRapidasIdoso extends ConsumerWidget {
  const _AcoesRapidasIdoso({required this.idoso});

  final Idoso idoso;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permiteSinaisVitais = ref.watch(featureLimitsProvider).permiteSinaisVitais;

    return Row(
      children: [
        Expanded(
          child: _AcaoRapida(
            icon: Icons.medication_outlined,
            rotulo: 'Medicação',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => MedicacaoFormScreen(idoso: idoso)),
            ),
          ),
        ),
        Expanded(
          child: _AcaoRapida(
            icon: Icons.event_note_outlined,
            rotulo: 'Consulta',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => ConsultaFormScreen(idoso: idoso)),
            ),
          ),
        ),
        Expanded(
          child: _AcaoRapida(
            icon: Icons.monitor_heart_outlined,
            rotulo: 'Sinais vitais',
            onPressed: () {
              if (!permiteSinaisVitais) {
                mostrarLimiteAtingido(
                  context,
                  mensagem: 'Registar sinais vitais é uma funcionalidade Premium. '
                      'Subscreve o Premium para a usares.',
                );
                return;
              }
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => SinaisVitaisFormScreen(idoso: idoso)),
              );
            },
          ),
        ),
        Expanded(
          child: _AcaoRapida(
            icon: Icons.picture_as_pdf_outlined,
            rotulo: 'Relatório',
            destacarGradiente: true,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => RelatorioScreen(idoso: idoso)),
            ),
          ),
        ),
      ],
    );
  }
}

class _AcaoRapida extends StatelessWidget {
  const _AcaoRapida({
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Material(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                destacarGradiente
                    ? GradientIcon(icon, size: 22)
                    : Icon(icon, color: Theme.of(context).colorScheme.onPrimaryContainer, size: 22),
                const SizedBox(height: 4),
                destacarGradiente
                    ? GradientText(
                        rotulo,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w600),
                      )
                    : Text(
                        rotulo,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

