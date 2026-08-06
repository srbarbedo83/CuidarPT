import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // Fundo em degradê, aplicado atrás de toda a app (ver app.dart). Escuro:
  // tom azulado claro em baixo -> ligeiramente mais escuro (mas ainda
  // azulado, nunca preto) em cima — degradê subtil. Claro: branco em
  // baixo -> um tom muito claro em cima.
  static const fundoClaroBaixo = Color(0xFFFFFFFF);
  static const fundoClaroTopo = Color(0xFFE7ECF7);
  static const fundoEscuroBaixo = Color(0xFF2A425C);
  static const fundoEscuroTopo = Color(0xFF1B2C40);

  static Gradient fundoGradiente(Brightness brightness) {
    final claro = brightness == Brightness.light;
    return LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: claro ? [fundoClaroBaixo, fundoClaroTopo] : [fundoEscuroBaixo, fundoEscuroTopo],
    );
  }

  /// Cor de fundo sólida (não degradê) para elementos que precisam de uma
  /// base opaca sobre o degradê (ex.: cabeçalho fixo do perfil), aproximada
  /// ao tom do topo do degradê para não destoar.
  static Color fundoSolido(Brightness brightness) {
    return brightness == Brightness.light ? fundoClaroTopo : fundoEscuroTopo;
  }

  // Cor de destaque para títulos de secções e da barra superior — mais
  // moderna do que preto/branco simples, mantendo bom contraste.
  static const _corTituloClaro = Color(0xFF2A4A8A);
  static const _corTituloEscuro = Color(0xFF9FB8F0);

  static const _fontFamily = 'WorkSans';

  static ActionIconThemeData get _iconesModernos => ActionIconThemeData(
        backButtonIconBuilder: (context) => const Icon(Icons.arrow_back_ios_new_rounded),
      );

  static ThemeData get claro {
    final base = ThemeData(
      colorSchemeSeed: Colors.indigo,
      useMaterial3: true,
      fontFamily: _fontFamily,
      visualDensity: VisualDensity.comfortable,
      scaffoldBackgroundColor: Colors.transparent,
      actionIconTheme: _iconesModernos,
    );
    return base.copyWith(
      textTheme: base.textTheme.copyWith(
        titleLarge: base.textTheme.titleLarge?.copyWith(color: _corTituloClaro),
        titleMedium: base.textTheme.titleMedium?.copyWith(color: _corTituloClaro),
        titleSmall: base.textTheme.titleSmall?.copyWith(color: _corTituloClaro),
      ),
      appBarTheme: base.appBarTheme.copyWith(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w700,
          fontSize: 22,
          color: _corTituloClaro,
        ),
      ),
    );
  }

  static ThemeData get escuro {
    // O texto por omissão do Material 3 no tema escuro é cinzento-claro
    // (não branco), para reduzir o brilho. Como a app é usada por pessoas
    // idosas, aumentamos o contraste aproximando o texto do branco puro.
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.indigo,
      brightness: Brightness.dark,
    ).copyWith(
      onSurface: Colors.white,
      onSurfaceVariant: const Color(0xFFE8E3EC),
    );
    final base = ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      fontFamily: _fontFamily,
      visualDensity: VisualDensity.comfortable,
      scaffoldBackgroundColor: Colors.transparent,
      actionIconTheme: _iconesModernos,
    );
    return base.copyWith(
      textTheme: base.textTheme.copyWith(
        titleLarge: base.textTheme.titleLarge?.copyWith(color: _corTituloEscuro),
        titleMedium: base.textTheme.titleMedium?.copyWith(color: _corTituloEscuro),
        titleSmall: base.textTheme.titleSmall?.copyWith(color: _corTituloEscuro),
      ),
      appBarTheme: base.appBarTheme.copyWith(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w700,
          fontSize: 22,
          color: _corTituloEscuro,
        ),
      ),
    );
  }
}
