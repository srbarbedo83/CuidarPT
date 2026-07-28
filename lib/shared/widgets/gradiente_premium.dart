import 'package:flutter/material.dart';

/// Gradiente azul → roxo usado para destacar elementos ligados a
/// funcionalidades Premium e a ações de gerar relatório.
const gradientePremium = LinearGradient(
  colors: [Color(0xFF2962FF), Color(0xFF9C27B0)],
);

/// Brilho (glow) na cor indicada, para usar no parâmetro `shadows` de
/// [Icon] fora do contexto do gradiente Premium (ex.: ícones de ação no
/// topo do perfil do idoso).
List<Shadow> glowShadow(Color color) => [Shadow(color: color.withValues(alpha: 0.6), blurRadius: 12)];

/// Texto pintado com [gradientePremium] (ou outro gradiente), com brilho
/// (glow) opcional atrás das letras.
class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    this.style,
    this.gradient = gradientePremium,
    this.glow = false,
    this.textAlign,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;
  final bool glow;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final baseStyle = (style ?? DefaultTextStyle.of(context).style).copyWith(
      color: Colors.white,
      shadows: glow ? [Shadow(color: gradient.colors.last.withValues(alpha: 0.6), blurRadius: 12)] : null,
    );
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: Text(text, style: baseStyle, textAlign: textAlign),
    );
  }
}

/// Ícone pintado com [gradientePremium] (ou outro gradiente), com brilho
/// (glow) opcional.
class GradientIcon extends StatelessWidget {
  const GradientIcon(
    this.icon, {
    super.key,
    this.size,
    this.gradient = gradientePremium,
  });

  final IconData icon;
  final double? size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: Icon(
        icon,
        size: size,
        color: Colors.white,
        shadows: [Shadow(color: gradient.colors.last.withValues(alpha: 0.6), blurRadius: 12)],
      ),
    );
  }
}
