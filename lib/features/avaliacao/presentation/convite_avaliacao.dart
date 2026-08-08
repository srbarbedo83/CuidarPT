import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_review/in_app_review.dart';

import '../../../l10n/app_localizations.dart';
import '../../subscricao/providers/subscricao_providers.dart';
import '../providers/avaliacao_providers.dart';
import '../services/convite_avaliacao_logica.dart';

/// Mostra um convite para avaliar a app a partir do 2º dia de uso, depois no
/// máximo semanalmente — ou sempre que [forcar] for `true` (ex.: ao gerar um
/// relatório). Sempre com a mesma mensagem para todos os utilizadores (sem
/// filtrar por satisfação), nunca como condição para usar qualquer
/// funcionalidade.
Future<void> mostrarConviteAvaliacaoSeNecessario(
  BuildContext context,
  WidgetRef ref, {
  bool forcar = false,
}) async {
  final instalacaoEm = (await ref.read(subscricaoRepositoryProvider).obterAtual())?.trialInicio;
  if (instalacaoEm == null) return;

  final repository = ref.read(estadoAvaliacaoAppRepositoryProvider);
  final ultimaVez = await repository.ultimaVezMostrado();
  final agora = DateTime.now();

  if (!deveMostrarConviteAvaliacao(
    agora: agora,
    instalacaoEm: instalacaoEm,
    ultimaVezMostrado: ultimaVez,
    forcar: forcar,
  )) {
    return;
  }

  await repository.marcarComoMostrado(agora);
  if (!context.mounted) return;

  final l10n = AppLocalizations.of(context);
  final avaliar = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(Icons.favorite_outline),
      title: Text(l10n.avaliacaoTitulo),
      content: Text(l10n.avaliacaoDescricao),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text(l10n.avaliacaoAgoraNao)),
        FilledButton(onPressed: () => Navigator.of(context).pop(true), child: Text(l10n.avaliacaoAvaliar)),
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
