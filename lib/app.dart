import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'features/home/presentation/home_shell_screen.dart';
import 'features/onboarding/presentation/onboarding_screen.dart';
import 'features/subscricao/providers/subscricao_providers.dart';

class CuidarPTApp extends StatelessWidget {
  const CuidarPTApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CuidarPT',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.claro,
      locale: const Locale('pt', 'PT'),
      supportedLocales: const [Locale('pt', 'PT'), Locale('pt')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const _AppStartupGate(),
    );
  }
}

/// Decide se mostra o onboarding (primeiro arranque, trial ainda não
/// iniciado) ou o ecrã inicial da app.
class _AppStartupGate extends ConsumerWidget {
  const _AppStartupGate();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final estadoAsync = ref.watch(estadoSubscricaoProvider);

    return estadoAsync.when(
      data: (estado) => estado == null ? const OnboardingScreen() : const HomeShellScreen(),
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (erro, _) => Scaffold(
        body: Center(child: Text('Ocorreu um erro ao carregar a app: $erro')),
      ),
    );
  }
}
