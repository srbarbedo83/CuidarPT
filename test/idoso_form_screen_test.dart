import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cuidarpt/features/idosos/presentation/idoso_form_screen.dart';

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

void main() {
  testWidgets('IdosoFormScreen mostra erro de validação sem nome', (tester) async {
    await _pumpComTamanhoGrande(tester, const IdosoFormScreen());

    expect(find.text('Novo perfil de idoso'), findsOneWidget);

    await tester.tap(find.text('Guardar'));
    await tester.pump();

    expect(find.text('Indica o nome do idoso'), findsOneWidget);
  });
}
