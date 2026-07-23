import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cuidarpt/data/models/idoso.dart';
import 'package:cuidarpt/features/medicacao/presentation/medicacao_form_screen.dart';

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
  testWidgets('MedicacaoFormScreen mostra erro de validação sem nome', (tester) async {
    await _pumpComTamanhoGrande(tester, MedicacaoFormScreen(idoso: _idosoFalso()));

    expect(find.text('Nova medicação'), findsOneWidget);

    await tester.tap(find.text('Guardar'));
    await tester.pump();

    expect(find.text('Indica o nome do medicamento'), findsOneWidget);
  });

  testWidgets('MedicacaoFormScreen sugere um horário por omissão num registo novo', (tester) async {
    await _pumpComTamanhoGrande(tester, MedicacaoFormScreen(idoso: _idosoFalso()));

    expect(find.text('09:00'), findsOneWidget);
  });

  testWidgets('MedicacaoFormScreen exige pelo menos um horário', (tester) async {
    await _pumpComTamanhoGrande(tester, MedicacaoFormScreen(idoso: _idosoFalso()));

    await tester.enterText(find.byType(TextFormField).first, 'Paracetamol');
    // Remove o horário sugerido por omissão para testar a validação.
    tester.widget<InputChip>(find.byType(InputChip)).onDeleted!();
    await tester.pump();

    await tester.tap(find.text('Guardar'));
    await tester.pump();

    expect(find.text('Adiciona pelo menos um horário'), findsOneWidget);
    expect(find.text('Indica o nome do medicamento'), findsNothing);
  });
}
