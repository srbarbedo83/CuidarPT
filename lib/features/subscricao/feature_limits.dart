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
  });

  /// `null` significa sem limite.
  final int? maxPerfisIdoso;
  final bool permitePdfPersonalizado;
  final bool permiteHistoricoIlimitado;
  final bool permiteExportacaoManual;
  final bool permiteAvisosOficiais;

  factory FeatureLimits.paraPlano(bool isPremium) {
    if (isPremium) {
      return const FeatureLimits(
        maxPerfisIdoso: null,
        permitePdfPersonalizado: true,
        permiteHistoricoIlimitado: true,
        permiteExportacaoManual: true,
        permiteAvisosOficiais: true,
      );
    }
    return const FeatureLimits(
      maxPerfisIdoso: 1,
      permitePdfPersonalizado: false,
      permiteHistoricoIlimitado: false,
      permiteExportacaoManual: false,
      permiteAvisosOficiais: false,
    );
  }
}

final featureLimitsProvider = Provider<FeatureLimits>((ref) {
  return FeatureLimits.paraPlano(ref.watch(isPremiumProvider));
});
