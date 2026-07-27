import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get claro {
    return ThemeData(
      colorSchemeSeed: Colors.indigo,
      useMaterial3: true,
      visualDensity: VisualDensity.comfortable,
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
    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      visualDensity: VisualDensity.comfortable,
    );
  }
}
