import 'package:cuidarpt/features/subscricao/feature_limits.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FeatureLimits', () {
    test('plano grátis limita a 1 perfil de idoso e bloqueia extras Premium', () {
      final limites = FeatureLimits.paraPlano(false);

      expect(limites.maxPerfisIdoso, 1);
      expect(limites.permitePdfPersonalizado, isFalse);
      expect(limites.permiteHistoricoIlimitado, isFalse);
      expect(limites.permiteExportacaoManual, isFalse);
      expect(limites.permiteAvisosOficiais, isFalse);
    });

    test('plano premium (ou trial ativo) remove limites', () {
      final limites = FeatureLimits.paraPlano(true);

      expect(limites.maxPerfisIdoso, isNull);
      expect(limites.permitePdfPersonalizado, isTrue);
      expect(limites.permiteHistoricoIlimitado, isTrue);
      expect(limites.permiteExportacaoManual, isTrue);
      expect(limites.permiteAvisosOficiais, isTrue);
    });
  });
}
