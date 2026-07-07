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
    return ThemeData(
      colorSchemeSeed: Colors.indigo,
      brightness: Brightness.dark,
      useMaterial3: true,
      visualDensity: VisualDensity.comfortable,
    );
  }
}
