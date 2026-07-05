import 'package:flutter/material.dart';

/// Diálogo de upsell mostrado quando uma ação exige Premium. Nunca bloqueia
/// a app nem condiciona o uso a uma avaliação na loja — só explica o
/// limite e sugere a subscrição.
Future<void> mostrarLimiteAtingido(BuildContext context, {required String mensagem}) {
  return showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(Icons.star_outline),
      title: const Text('Funcionalidade Premium'),
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
