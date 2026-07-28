import 'package:flutter/material.dart';

/// Aproximação do logótipo (escudo + coração) enquanto o ficheiro de
/// imagem definitivo não é fornecido. Substituir por Image.asset assim
/// que o PNG final estiver disponível.
class LogoApp extends StatelessWidget {
  const LogoApp({super.key, this.size = 36});

  final double size;

  static const _azulEscudo = Color(0xFF2C4A6E);
  static const _laranjaCoracao = Color(0xFFF5A623);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(Icons.shield_outlined, size: size, color: _azulEscudo),
          Icon(Icons.favorite, size: size / 2, color: _laranjaCoracao),
        ],
      ),
    );
  }
}
