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

    test('alerta de atenção (amarelo) para hipertensão', () {
      final registo = _registo(sistolica: 150, diastolica: 95);

      final alertas = alertasSinaisVitais(registo);
      expect(alertas.single.mensagem, 'Pressão arterial elevada (hipertensão)');
      expect(alertas.single.gravidade, GravidadeAlerta.atencao);
    });

    test('alerta grave (vermelho) com crise hipertensiva', () {
      final registo = _registo(sistolica: 185, diastolica: 125);

      final alertas = alertasSinaisVitais(registo);
      expect(alertas.single.mensagem, 'Pressão arterial muito elevada (possível crise hipertensiva)');
      expect(alertas.single.gravidade, GravidadeAlerta.grave);
    });

    test('alerta de atenção com hipotensão', () {
      final registo = _registo(sistolica: 85, diastolica: 55);

      expect(alertasSinaisVitais(registo).single.gravidade, GravidadeAlerta.atencao);
    });

    test('alerta de atenção com febre e grave com febre alta', () {
      expect(alertasSinaisVitais(_registo(temperatura: 38.5)).single.gravidade, GravidadeAlerta.atencao);
      expect(alertasSinaisVitais(_registo(temperatura: 39.5)).single.gravidade, GravidadeAlerta.grave);
    });

    test('alerta grave com hipotermia', () {
      expect(alertasSinaisVitais(_registo(temperatura: 34.5)).single.gravidade, GravidadeAlerta.grave);
    });

    test('alerta grave com hipoglicemia e hiperglicemia muito elevada', () {
      expect(alertasSinaisVitais(_registo(glicemia: 60)).single.gravidade, GravidadeAlerta.grave);
      expect(alertasSinaisVitais(_registo(glicemia: 190)).single.gravidade, GravidadeAlerta.grave);
    });

    test('alerta de atenção com glicemia moderadamente elevada', () {
      expect(alertasSinaisVitais(_registo(glicemia: 150)).single.gravidade, GravidadeAlerta.atencao);
    });

    test('alerta de atenção com bradicardia e taquicardia', () {
      expect(alertasSinaisVitais(_registo(frequenciaCardiaca: 50)).single.gravidade, GravidadeAlerta.atencao);
      expect(alertasSinaisVitais(_registo(frequenciaCardiaca: 110)).single.gravidade, GravidadeAlerta.atencao);
    });

    test('ignora sinais não registados (null)', () {
      expect(alertasSinaisVitais(_registo()), isEmpty);
    });
  });

  group('piorGravidade', () {
    test('devolve null quando não há alertas', () {
      expect(piorGravidade(const []), isNull);
    });

    test('devolve grave se houver pelo menos um alerta grave', () {
      final alertas = alertasSinaisVitais(_registo(sistolica: 185, diastolica: 70, glicemia: 150));

      expect(piorGravidade(alertas), GravidadeAlerta.grave);
    });

    test('devolve atenção se só houver alertas de atenção', () {
      final alertas = alertasSinaisVitais(_registo(sistolica: 150, diastolica: 95));

      expect(piorGravidade(alertas), GravidadeAlerta.atencao);
    });
  });
}
