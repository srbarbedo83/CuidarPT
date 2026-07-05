import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/services/notification_service.dart';
import 'data/local/isar_providers.dart';
import 'data/local/isar_service.dart';
import 'features/medicacao/services/reagendar_lembretes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isar = await IsarService.open();

  await NotificationService.instance.init();
  await reagendarLembretesMedicacaoPendentes(isar);

  runApp(
    ProviderScope(
      overrides: [isarInstanceProvider.overrideWithValue(isar)],
      child: const CuidarPTApp(),
    ),
  );
}
