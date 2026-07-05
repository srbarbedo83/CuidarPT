import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'data/local/isar_providers.dart';
import 'data/local/isar_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isar = await IsarService.open();

  runApp(
    ProviderScope(
      overrides: [isarInstanceProvider.overrideWithValue(isar)],
      child: const CuidarPTApp(),
    ),
  );
}
