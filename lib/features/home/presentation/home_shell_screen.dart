import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../subscricao/providers/subscricao_providers.dart';

/// Ecrã inicial provisório: mostra o estado da subscrição enquanto as
/// restantes funcionalidades (perfis, medicação, consultas, ...) ainda não
/// foram implementadas.
class HomeShellScreen extends ConsumerWidget {
  const HomeShellScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final estado = ref.watch(estadoSubscricaoProvider).value;

    return Scaffold(
      appBar: AppBar(title: const Text('CuidarPT')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    estado?.isPremium ?? false ? Icons.star : Icons.star_border,
                    size: 40,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    estado == null
                        ? 'A carregar...'
                        : estado.trialAtivo
                            ? 'Período experimental Premium: faltam '
                                '${estado.diasRestantesTrial} dia(s)'
                            : estado.premiumAtivo
                                ? 'Plano Premium ativo'
                                : 'Plano Grátis',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
