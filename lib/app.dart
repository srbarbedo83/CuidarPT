import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'data/models/preferencias_app.dart';
import 'features/definicoes/providers/preferencias_providers.dart';
import 'features/home/presentation/home_shell_screen.dart';
import 'features/onboarding/presentation/onboarding_screen.dart';
import 'features/subscricao/providers/subscricao_providers.dart';
import 'l10n/app_localizations.dart';
import 'shared/widgets/logo_app.dart';

class CuidarPTApp extends ConsumerWidget {
  const CuidarPTApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tema = ref.watch(temaPreferidoProvider);
    final escalaTexto = ref.watch(escalaTextoProvider);
    final idioma = ref.watch(idiomaPreferidoProvider);

    final ThemeMode themeMode = switch (tema) {
      TemaPreferido.sistema => ThemeMode.system,
      TemaPreferido.claro => ThemeMode.light,
      TemaPreferido.escuro => ThemeMode.dark,
    };

    final Locale? locale = switch (idioma) {
      IdiomaPreferido.sistema => null,
      IdiomaPreferido.pt => const Locale('pt', 'PT'),
      IdiomaPreferido.en => const Locale('en'),
      IdiomaPreferido.es => const Locale('es'),
    };

    return MaterialApp(
      title: 'CuidarPT',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.claro,
      darkTheme: AppTheme.escuro,
      themeMode: themeMode,
      locale: locale,
      // Ordem começa em português (mercado de origem da app): se o idioma
      // for "Sistema" e o telemóvel estiver noutro idioma não suportado
      // (ex.: francês), a app cai em português em vez de inglês.
      supportedLocales: const [
        Locale('pt', 'PT'),
        Locale('pt'),
        Locale('en'),
        Locale('es'),
      ],
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      builder: (context, child) {
        return DecoratedBox(
          decoration: BoxDecoration(gradient: AppTheme.fundoGradiente(Theme.of(context).brightness)),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.linear(escalaTexto),
            ),
            child: child!,
          ),
        );
      },
      home: const _AppStartupGate(),
    );
  }
}

/// Decide se mostra o onboarding (primeiro arranque, trial ainda não
/// iniciado) ou o ecrã inicial da app, com uma transição animada (em vez de
/// uma troca abrupta) entre o ecrã de arranque e o resto da app.
class _AppStartupGate extends ConsumerWidget {
  const _AppStartupGate();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final estadoAsync = ref.watch(estadoSubscricaoProvider);

    final conteudo = estadoAsync.when(
      data: (estado) => estado == null
          ? const OnboardingScreen(key: ValueKey('onboarding'))
          : const HomeShellScreen(key: ValueKey('home')),
      loading: () => const _EcraArranque(key: ValueKey('arranque')),
      error: (erro, _) => _EcraErroArranque(erro: erro, key: const ValueKey('erro')),
    );

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 550),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.96, end: 1).animate(animation),
            child: child,
          ),
        );
      },
      child: conteudo,
    );
  }
}

class _EcraArranque extends StatelessWidget {
  const _EcraArranque({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LogoApp(size: 96),
            SizedBox(height: 24),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class _EcraErroArranque extends StatelessWidget {
  const _EcraErroArranque({super.key, required this.erro});

  final Object erro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(AppLocalizations.of(context).erroArranqueTexto('$erro'))),
    );
  }
}
