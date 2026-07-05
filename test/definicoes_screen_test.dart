import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cuidarpt/features/definicoes/presentation/definicoes_screen.dart';

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
  testWidgets('DefinicoesScreen mostra as secções principais e o diálogo de subscrição', (tester) async {
    await _pumpComTamanhoGrande(tester, const DefinicoesScreen());
    await tester.pump();

    expect(find.text('Definições'), findsOneWidget);
    expect(find.text('Subscrição'), findsOneWidget);
    expect(find.text('Perfis de idosos'), findsOneWidget);
    expect(find.text('Sobre'), findsOneWidget);
    expect(find.text('€1,99/mês ou €19,99/ano'), findsOneWidget);

    await tester.tap(find.text('Subscrever Premium'));
    await tester.pumpAndSettle();

    expect(find.text('Subscrição Premium'), findsOneWidget);
  });
}
