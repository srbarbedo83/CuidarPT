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
  testWidgets('CuidadoDiarioFormScreen mostra só o campo de nota e a data', (tester) async {
    await _pumpComTamanhoGrande(tester, CuidadoDiarioFormScreen(idoso: _idosoFalso()));

    expect(find.text('Nova nota'), findsOneWidget);
    expect(find.text('Nota'), findsOneWidget);
    expect(find.text('Data e hora'), findsOneWidget);
    expect(find.text('Guardar'), findsOneWidget);
  });
}
