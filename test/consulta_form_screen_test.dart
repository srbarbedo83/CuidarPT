import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cuidarpt/data/models/idoso.dart';
import 'package:cuidarpt/features/consultas/presentation/consulta_form_screen.dart';
import 'package:cuidarpt/l10n/app_localizations.dart';

Future<void> _pumpComTamanhoGrande(WidgetTester tester, Widget home) async {
  tester.view.physicalSize = const Size(800, 2000);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  await tester.pumpWidget(
    ProviderScope(
      child: MaterialApp(
        locale: const Locale('pt', 'PT'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: home,
      ),
    ),
  );
}

Idoso _idosoFalso() {
  final agora = DateTime.now();
  return Idoso()
    ..id = 1
    ..nome = 'Ana'
    ..criadoEm = agora
    ..atualizadoEm = agora;
}

void main() {
  testWidgets('ConsultaFormScreen mostra erro de validação sem especialidade', (tester) async {
    await _pumpComTamanhoGrande(tester, ConsultaFormScreen(idoso: _idosoFalso()));

    expect(find.text('Nova consulta'), findsOneWidget);

    await tester.tap(find.text('Guardar'));
    await tester.pump();

    expect(find.text('Indica a especialidade'), findsOneWidget);
  });
}
