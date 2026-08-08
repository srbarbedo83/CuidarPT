import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/services/notification_service.dart';
import 'data/local/isar_providers.dart';
import 'data/local/isar_service.dart';
import 'data/models/preferencias_app.dart';
import 'data/repositories/preferencias_repository.dart';
import 'data/repositories/subscricao_repository.dart';
import 'features/consultas/services/reagendar_lembretes.dart';
import 'features/medicacao/services/reagendar_lembretes.dart';
import 'features/subscricao/services/compra_premium_service.dart';
import 'l10n/app_localizations.dart';
import 'l10n/app_localizations_pt.dart';

/// Resolve o idioma a usar para os textos das notificações reagendadas no
/// arranque da app — antes de existir uma árvore de widgets (por isso não
/// há [BuildContext] disponível), lê a preferência guardada diretamente.
AppLocalizations _resolverIdiomaNotificacoes(IdiomaPreferido idioma) {
  final locale = switch (idioma) {
    IdiomaPreferido.pt => const Locale('pt'),
    IdiomaPreferido.en => const Locale('en'),
    IdiomaPreferido.es => const Locale('es'),
    IdiomaPreferido.sistema => WidgetsBinding.instance.platformDispatcher.locale,
  };
  final suportado = AppLocalizations.supportedLocales
      .any((suportada) => suportada.languageCode == locale.languageCode);
  return suportado ? lookupAppLocalizations(locale) : AppLocalizationsPt();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isar = await IsarService.open();

  final preferencias = await PreferenciasRepository(isar).obterAtual();
  final l10nNotificacoes = _resolverIdiomaNotificacoes(preferencias?.idioma ?? IdiomaPreferido.sistema);

  await NotificationService.instance.init();
  await reagendarLembretesMedicacaoPendentes(isar, l10nNotificacoes);
  await reagendarLembretesConsultasPendentes(isar, l10nNotificacoes);

  final compraPremiumService = CompraPremiumService(SubscricaoRepository(isar));
  if (await compraPremiumService.disponivel()) {
    compraPremiumService.iniciarEscuta();
    unawaited(compraPremiumService.restaurarCompras());
  }

  runApp(
    ProviderScope(
      overrides: [isarInstanceProvider.overrideWithValue(isar)],
      child: const CuidarPTApp(),
    ),
  );
}
