import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_review/in_app_review.dart';

import '../providers/avaliacao_providers.dart';

/// Mostra, uma única vez, um convite para avaliar a app — sempre com a
/// mesma mensagem para todos os utilizadores (sem filtrar por satisfação),
/// nunca como condição para usar qualquer funcionalidade.
Future<void> mostrarConviteAvaliacaoSeNecessario(BuildContext context, WidgetRef ref) async {
  final repository = ref.read(estadoAvaliacaoAppRepositoryProvider);
  if (await repository.jaMostrado()) return;
  await repository.marcarComoMostrado();
  if (!context.mounted) return;

  final avaliar = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(Icons.favorite_outline),
      title: const Text('Estás a gostar do CuidarPT?'),
      content: const Text(
        'Se o CuidarPT te está a ajudar a cuidar de quem mais precisa, uma '
        'avaliação na loja ajuda outras famílias a encontrarem a app.',
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Agora não')),
        FilledButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Avaliar a app')),
      ],
    ),
  );

  if (avaliar == true) {
    final inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) {
      await inAppReview.requestReview();
    } else {
      await inAppReview.openStoreListing();
    }
  }
}
