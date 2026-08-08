import 'package:cuidarpt/data/models/registo_sinais_vitais.dart';
import 'package:cuidarpt/features/sinais_vitais/services/alertas_sinais_vitais.dart';
import 'package:cuidarpt/l10n/app_localizations_pt.dart';
import 'package:flutter_test/flutter_test.dart';

final _l10n = AppLocalizationsPt();

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

List<AlertaSinalVital> _alertas(RegistoSinaisVitais registo) => alertasSinaisVitais(_l10n, registo);

void main() {
  group('alertasSinaisVitais', () {
    test('não gera alertas para valores dentro da normalidade', () {
      final registo = _registo(sistolica: 115, diastolica: 75, temperatura: 36.5, glicemia: 90, frequenciaCardiaca: 70);

      expect(_alertas(registo), isEmpty);
    });

    test('alerta de atenção (amarelo) para hipertensão', () {
      final registo = _registo(sistolica: 150, diastolica: 95);

      final alertas = _alertas(registo);
      expect(alertas.single.mensagem, _l10n.alertaPressaoElevada);
      expect(alertas.single.gravidade, GravidadeAlerta.atencao);
    });

    test('alerta grave (vermelho) com crise hipertensiva', () {
      final registo = _registo(sistolica: 185, diastolica: 125);

      final alertas = _alertas(registo);
      expect(alertas.single.mensagem, _l10n.alertaPressaoMuitoElevada);
      expect(alertas.single.gravidade, GravidadeAlerta.grave);
    });

    test('alerta de atenção com hipotensão', () {
      final registo = _registo(sistolica: 85, diastolica: 55);

      expect(_alertas(registo).single.gravidade, GravidadeAlerta.atencao);
    });

    test('alerta de atenção com febre e grave com febre alta', () {
      expect(_alertas(_registo(temperatura: 38.5)).single.gravidade, GravidadeAlerta.atencao);
      expect(_alertas(_registo(temperatura: 39.5)).single.gravidade, GravidadeAlerta.grave);
    });

    test('alerta grave com hipotermia', () {
      expect(_alertas(_registo(temperatura: 34.5)).single.gravidade, GravidadeAlerta.grave);
    });

    test('alerta grave com hipoglicemia e hiperglicemia muito elevada', () {
      expect(_alertas(_registo(glicemia: 60)).single.gravidade, GravidadeAlerta.grave);
      expect(_alertas(_registo(glicemia: 190)).single.gravidade, GravidadeAlerta.grave);
    });

    test('alerta de atenção com glicemia moderadamente elevada', () {
      expect(_alertas(_registo(glicemia: 150)).single.gravidade, GravidadeAlerta.atencao);
    });

    test('alerta de atenção com bradicardia e taquicardia', () {
      expect(_alertas(_registo(frequenciaCardiaca: 50)).single.gravidade, GravidadeAlerta.atencao);
      expect(_alertas(_registo(frequenciaCardiaca: 110)).single.gravidade, GravidadeAlerta.atencao);
    });

    test('ignora sinais não registados (null)', () {
      expect(_alertas(_registo()), isEmpty);
    });
  });

  group('piorGravidade', () {
    test('devolve null quando não há alertas', () {
      expect(piorGravidade(const []), isNull);
    });

    test('devolve grave se houver pelo menos um alerta grave', () {
      final alertas = _alertas(_registo(sistolica: 185, diastolica: 70, glicemia: 150));

      expect(piorGravidade(alertas), GravidadeAlerta.grave);
    });

    test('devolve atenção se só houver alertas de atenção', () {
      final alertas = _alertas(_registo(sistolica: 150, diastolica: 95));

      expect(piorGravidade(alertas), GravidadeAlerta.atencao);
    });
  });
}
