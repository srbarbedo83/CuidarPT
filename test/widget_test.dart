import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cuidarpt/features/onboarding/presentation/onboarding_screen.dart';
import 'package:cuidarpt/l10n/app_localizations.dart';

Future<void> _pumpOnboarding(WidgetTester tester) async {
  tester.view.physicalSize = const Size(800, 2000);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  await tester.pumpWidget(
    const ProviderScope(
      child: MaterialApp(
        locale: Locale('pt', 'PT'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: OnboardingScreen(),
      ),
    ),
  );
}

void main() {
  testWidgets('OnboardingScreen mostra o primeiro slide e avança até ao botão Começar',
      (tester) async {
    await _pumpOnboarding(tester);

    expect(find.text('Bem-vindo ao CuidarPT'), findsOneWidget);
    expect(find.text('Seguinte'), findsOneWidget);
    expect(find.text('Começar'), findsNothing);

    await tester.tap(find.text('Seguinte'));
    await tester.pumpAndSettle();
    expect(find.text('Registos simples do dia a dia'), findsOneWidget);

    await tester.tap(find.text('Seguinte'));
    await tester.pumpAndSettle();
    expect(find.text('Tudo guardado no seu telemóvel'), findsOneWidget);
    expect(find.text('Começar'), findsNothing);

    await tester.tap(find.text('Seguinte'));
    await tester.pumpAndSettle();
    expect(find.text('Quantos idosos vais acompanhar?'), findsOneWidget);
    expect(find.text('Começar'), findsNothing);

    await tester.tap(find.text('Seguinte'));
    await tester.pumpAndSettle();
    expect(find.text('O teu email (opcional)'), findsOneWidget);
    expect(find.text('Começar'), findsNothing);

    await tester.tap(find.text('Seguinte'));
    await tester.pumpAndSettle();
    expect(find.text('Antes de começar'), findsOneWidget);
    expect(find.text('Começar'), findsOneWidget);
    expect(tester.widget<FilledButton>(find.byType(FilledButton)).onPressed, isNull);

    await tester.tap(find.text('Li e percebi'));
    await tester.pumpAndSettle();
    expect(tester.widget<FilledButton>(find.byType(FilledButton)).onPressed, isNotNull);
  });
}
