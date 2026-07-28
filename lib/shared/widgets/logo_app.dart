import 'package:flutter/material.dart';

/// Logótipo oficial da app (ficheiro fornecido pelo utilizador), usado no
/// ecrã de arranque, no onboarding e no AppBar do ecrã inicial.
class LogoApp extends StatelessWidget {
  const LogoApp({super.key, this.size = 36});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset('store_assets/logo1.png', height: size);
  }
}
