import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/estado_subscricao.dart';
import '../../idosos/providers/idoso_providers.dart';
import '../../subscricao/feature_limits.dart';
import '../../subscricao/providers/subscricao_providers.dart';
import '../providers/definicoes_providers.dart';

class DefinicoesScreen extends ConsumerWidget {
  const DefinicoesScreen({super.key});

  Future<void> _mostrarInfoSubscricao(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Subscrição Premium'),
        content: const Text(
          'A compra do Premium via Google Play estará disponível numa '
          'próxima atualização.\n\nPreço previsto: €1,99/mês ou €19,99/ano.',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Entendido')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final estado = ref.watch(estadoSubscricaoProvider).valueOrNull;
    final limites = ref.watch(featureLimitsProvider);
    final idosos = ref.watch(idosoListProvider).valueOrNull ?? const [];
    final packageInfo = ref.watch(packageInfoProvider).valueOrNull;

    return Scaffold(
      appBar: AppBar(title: const Text('Definições')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SeccaoSubscricao(estado: estado, onSubscrever: () => _mostrarInfoSubscricao(context)),
          const SizedBox(height: 16),
          _SeccaoPerfis(totalIdosos: idosos.length, maxPerfisIdoso: limites.maxPerfisIdoso),
          const SizedBox(height: 16),
          _SeccaoSobre(versao: packageInfo?.version),
        ],
      ),
    );
  }
}

class _SeccaoSubscricao extends StatelessWidget {
  const _SeccaoSubscricao({required this.estado, required this.onSubscrever});

  final EstadoSubscricao? estado;
  final VoidCallback onSubscrever;

  @override
  Widget build(BuildContext context) {
    final estadoAtual = estado;
    final String status;
    if (estadoAtual == null) {
      status = 'A carregar...';
    } else if (estadoAtual.trialAtivo) {
      status = 'Período experimental Premium — faltam ${estadoAtual.diasRestantesTrial} dia(s).';
    } else if (estadoAtual.premiumAtivo) {
      status = 'Plano Premium ativo.';
    } else {
      status = 'Plano Grátis.';
    }

    final semSubscricaoPaga = estadoAtual == null || !estadoAtual.premiumAtivo;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Subscrição', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(status),
            const SizedBox(height: 12),
            Text('O que inclui o Premium:', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 4),
            const _ItemBeneficio('Perfis de idosos ilimitados'),
            const _ItemBeneficio('Relatórios PDF personalizáveis (nome/logótipo)'),
            const _ItemBeneficio('Histórico e período de relatório ilimitados'),
            const _ItemBeneficio('Avisos meteorológicos oficiais'),
            const SizedBox(height: 8),
            Text(
              '€1,99/mês ou €19,99/ano',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            if (semSubscricaoPaga) ...[
              const SizedBox(height: 12),
              FilledButton(onPressed: onSubscrever, child: const Text('Subscrever Premium')),
            ],
          ],
        ),
      ),
    );
  }
}

class _ItemBeneficio extends StatelessWidget {
  const _ItemBeneficio(this.texto);

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check, size: 16),
          const SizedBox(width: 6),
          Expanded(child: Text(texto, style: Theme.of(context).textTheme.bodySmall)),
        ],
      ),
    );
  }
}

class _SeccaoPerfis extends StatelessWidget {
  const _SeccaoPerfis({required this.totalIdosos, required this.maxPerfisIdoso});

  final int totalIdosos;
  final int? maxPerfisIdoso;

  @override
  Widget build(BuildContext context) {
    final limiteTexto = maxPerfisIdoso == null ? 'ilimitados' : '$maxPerfisIdoso';
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Perfis de idosos', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text('$totalIdosos de $limiteTexto perfis em uso.'),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Ver perfis'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SeccaoSobre extends StatelessWidget {
  const _SeccaoSobre({required this.versao});

  final String? versao;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sobre', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text('CuidarPT${versao != null ? ' — versão $versao' : ''}'),
            const SizedBox(height: 4),
            Text(
              'Todos os dados ficam guardados apenas neste telemóvel.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
