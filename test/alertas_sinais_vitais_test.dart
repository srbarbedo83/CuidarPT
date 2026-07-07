import 'package:cuidarpt/data/models/registo_sinais_vitais.dart';
import 'package:cuidarpt/features/sinais_vitais/services/alertas_sinais_vitais.dart';
import 'package:flutter_test/flutter_test.dart';

RegistoSinaisVitais _registo({
  int? sistolica,
  int? diastolica,
  double? temperatura,
  int? glicemia,
  int? frequenciaCardiaca,
}) {
  return RegistoSinaisVitais()
    ..idosoId = 1
    ..pressaoSistolica = sistolica
    ..pressaoDiastolica = diastolica
    ..temperatura = temperatura
    ..glicemia = glicemia
    ..frequenciaCardiaca = frequenciaCardiaca
    ..timestamp = DateTime(2026, 7, 7);
}

void main() {
  group('alertasSinaisVitais', () {
    test('não gera alertas para valores dentro da normalidade', () {
      final registo = _registo(sistolica: 115, diastolica: 75, temperatura: 36.5, glicemia: 90, frequenciaCardiaca: 70);

      expect(alertasSinaisVitais(registo), isEmpty);
    });

    test('alerta de hipertensão quando sistólica ou diastólica estão elevadas', () {
      final registo = _registo(sistolica: 150, diastolica: 95);

      expect(alertasSinaisVitais(registo), contains('Pressão arterial elevada (hipertensão)'));
    });

    test('alerta de crise hipertensiva com valores muito altos', () {
      final registo = _registo(sistolica: 185, diastolica: 125);

      expect(alertasSinaisVitais(registo), contains('Pressão arterial muito elevada (possível crise hipertensiva)'));
    });

    test('alerta de hipotensão quando pressão está baixa', () {
      final registo = _registo(sistolica: 85, diastolica: 55);

      expect(alertasSinaisVitais(registo), contains('Pressão arterial baixa (hipotensão)'));
    });

    test('alerta de febre com temperatura elevada', () {
      final registo = _registo(temperatura: 38.5);

      expect(alertasSinaisVitais(registo), contains('Febre'));
    });

    test('alerta de hipotermia com temperatura muito baixa', () {
      final registo = _registo(temperatura: 34.5);

      expect(alertasSinaisVitais(registo), contains('Temperatura corporal muito baixa (hipotermia)'));
    });

    test('alerta de hipoglicemia e hiperglicemia', () {
      expect(alertasSinaisVitais(_registo(glicemia: 60)), contains('Glicemia baixa (hipoglicemia)'));
      expect(alertasSinaisVitais(_registo(glicemia: 190)), contains('Glicemia muito elevada'));
    });

    test('alerta de bradicardia e taquicardia', () {
      expect(alertasSinaisVitais(_registo(frequenciaCardiaca: 50)), contains('Frequência cardíaca baixa (bradicardia)'));
      expect(alertasSinaisVitais(_registo(frequenciaCardiaca: 110)), contains('Frequência cardíaca elevada (taquicardia)'));
    });

    test('ignora sinais não registados (null)', () {
      expect(alertasSinaisVitais(_registo()), isEmpty);
    });
  });
}
