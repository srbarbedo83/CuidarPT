import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/subscricao_providers.dart';

/// Limites derivados do plano atual (grátis/trial/Premium). Ponto único de
/// decisão: para mudar as regras do plano grátis, muda-se só aqui.
class FeatureLimits {
  const FeatureLimits({
    required this.maxPerfisIdoso,
    required this.permitePdfPersonalizado,
    required this.permiteHistoricoIlimitado,
    required this.permiteExportacaoManual,
    required this.permiteAvisosOficiais,
    required this.permiteRotinas,
    required this.permiteSinaisVitais,
    required this.permiteFrequenciaCardiacaCamera,
  });

  /// `null` significa sem limite.
  final int? maxPerfisIdoso;
  final bool permitePdfPersonalizado;
  final bool permiteHistoricoIlimitado;
  final bool permiteExportacaoManual;
  final bool permiteAvisosOficiais;
  final bool permiteRotinas;
  final bool permiteSinaisVitais;

  /// Medir a frequência cardíaca com a câmara (PPG) é Premium; registar um
  /// valor manualmente continua disponível no plano Grátis.
  final bool permiteFrequenciaCardiacaCamera;

  factory FeatureLimits.paraPlano(bool isPremium) {
    if (isPremium) {
      return const FeatureLimits(
        maxPerfisIdoso: null,
        permitePdfPersonalizado: true,
        permiteHistoricoIlimitado: true,
        permiteExportacaoManual: true,
        permiteAvisosOficiais: true,
        permiteRotinas: true,
        permiteSinaisVitais: true,
        permiteFrequenciaCardiacaCamera: true,
      );
    }
    return const FeatureLimits(
      maxPerfisIdoso: 2,
      permitePdfPersonalizado: false,
      permiteHistoricoIlimitado: false,
      permiteExportacaoManual: false,
      permiteAvisosOficiais: false,
      permiteRotinas: false,
      permiteSinaisVitais: false,
      permiteFrequenciaCardiacaCamera: false,
    );
  }
}

final featureLimitsProvider = Provider<FeatureLimits>((ref) {
  return FeatureLimits.paraPlano(ref.watch(isPremiumProvider));
});
