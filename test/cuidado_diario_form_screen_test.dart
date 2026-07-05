import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cuidarpt/data/models/idoso.dart';
import 'package:cuidarpt/features/cuidados_diarios/presentation/cuidado_diario_form_screen.dart';

Future<void> _pumpComTamanhoGrande(WidgetTester tester, Widget home) async {
  tester.view.physicalSize = const Size(800, 2000);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  await tester.pumpWidget(
    ProviderScope(
      child: MaterialApp(home: home),
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
  testWidgets('CuidadoDiarioFormScreen só mostra nível de humor quando tipo é Humor', (tester) async {
    await _pumpComTamanhoGrande(tester, CuidadoDiarioFormScreen(idoso: _idosoFalso()));

    expect(find.text('Nível de humor'), findsNothing);

    await tester.tap(find.text('Humor'));
    await tester.pump();

    expect(find.text('Nível de humor'), findsOneWidget);

    await tester.tap(find.text('Higiene'));
    await tester.pump();

    expect(find.text('Nível de humor'), findsNothing);
  });
}
