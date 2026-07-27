import 'package:flutter/material.dart';

import 'gradiente_premium.dart';

/// Diálogo de upsell mostrado quando uma ação exige Premium. Nunca bloqueia
/// a app nem condiciona o uso a uma avaliação na loja — só explica o
/// limite e sugere a subscrição.
Future<void> mostrarLimiteAtingido(BuildContext context, {required String mensagem}) {
  return showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      icon: const GradientIcon(Icons.star_outline, size: 32),
      title: const GradientText('Funcionalidade Premium', textAlign: TextAlign.center, glow: true),
      content: Text(mensagem),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Entendido'),
        ),
      ],
    ),
  );
}
