import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/services/notification_service.dart';
import 'data/local/isar_providers.dart';
import 'data/local/isar_service.dart';
import 'data/repositories/subscricao_repository.dart';
import 'features/consultas/services/reagendar_lembretes.dart';
import 'features/medicacao/services/reagendar_lembretes.dart';
import 'features/subscricao/services/compra_premium_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isar = await IsarService.open();

  await NotificationService.instance.init();
  await reagendarLembretesMedicacaoPendentes(isar);
  await reagendarLembretesConsultasPendentes(isar);

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
