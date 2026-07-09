import 'package:cuidarpt/features/subscricao/feature_limits.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FeatureLimits', () {
    test('plano grátis limita a 2 perfis de idoso e bloqueia extras Premium', () {
      final limites = FeatureLimits.paraPlano(false);

      expect(limites.maxPerfisIdoso, 2);
      expect(limites.permitePdfPersonalizado, isFalse);
      expect(limites.permiteHistoricoIlimitado, isFalse);
      expect(limites.permiteExportacaoManual, isFalse);
      expect(limites.permiteAvisosOficiais, isFalse);
      expect(limites.permiteRotinas, isFalse);
      expect(limites.permiteSinaisVitais, isFalse);
      expect(limites.permiteFrequenciaCardiacaCamera, isFalse);
    });

    test('plano premium (ou trial ativo) remove limites', () {
      final limites = FeatureLimits.paraPlano(true);

      expect(limites.maxPerfisIdoso, isNull);
      expect(limites.permitePdfPersonalizado, isTrue);
      expect(limites.permiteHistoricoIlimitado, isTrue);
      expect(limites.permiteExportacaoManual, isTrue);
      expect(limites.permiteAvisosOficiais, isTrue);
      expect(limites.permiteRotinas, isTrue);
      expect(limites.permiteSinaisVitais, isTrue);
      expect(limites.permiteFrequenciaCardiacaCamera, isTrue);
    });
  });
}
