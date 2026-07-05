import 'package:cuidarpt/data/models/estado_subscricao.dart';
import 'package:flutter_test/flutter_test.dart';

EstadoSubscricao _criar({
  required DateTime trialInicio,
  required DateTime trialFim,
  Plano plano = Plano.free,
  DateTime? premiumExpiraEm,
}) {
  return EstadoSubscricao()
    ..trialInicio = trialInicio
    ..trialFim = trialFim
    ..plano = plano
    ..premiumExpiraEm = premiumExpiraEm;
}

void main() {
  group('EstadoSubscricao', () {
    test('isPremium é true durante o trial de 7 dias', () {
      final agora = DateTime.now();
      final estado = _criar(
        trialInicio: agora,
        trialFim: agora.add(const Duration(days: 7)),
      );

      expect(estado.trialAtivo, isTrue);
      expect(estado.isPremium, isTrue);
    });

    test('isPremium é false no plano Free depois do trial terminar', () {
      final agora = DateTime.now();
      final estado = _criar(
        trialInicio: agora.subtract(const Duration(days: 10)),
        trialFim: agora.subtract(const Duration(days: 3)),
      );

      expect(estado.trialAtivo, isFalse);
      expect(estado.isPremium, isFalse);
      expect(estado.diasRestantesTrial, 0);
    });

    test('isPremium é true com plano Premium ativo mesmo sem trial', () {
      final agora = DateTime.now();
      final estado = _criar(
        trialInicio: agora.subtract(const Duration(days: 30)),
        trialFim: agora.subtract(const Duration(days: 23)),
        plano: Plano.premium,
        premiumExpiraEm: agora.add(const Duration(days: 20)),
      );

      expect(estado.trialAtivo, isFalse);
      expect(estado.premiumAtivo, isTrue);
      expect(estado.isPremium, isTrue);
    });

    test('diasRestantesTrial arredonda para cima as horas restantes', () {
      final agora = DateTime.now();
      final estado = _criar(
        trialInicio: agora,
        trialFim: agora.add(const Duration(hours: 25)),
      );

      expect(estado.diasRestantesTrial, 2);
    });
  });
}
