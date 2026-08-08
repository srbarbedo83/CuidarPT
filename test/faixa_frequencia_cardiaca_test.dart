import 'package:cuidarpt/features/frequencia_cardiaca/services/faixa_frequencia_cardiaca.dart';
import 'package:cuidarpt/l10n/app_localizations_pt.dart';
import 'package:flutter_test/flutter_test.dart';

final _l10n = AppLocalizationsPt();

void main() {
  group('calcularIdadeAnos', () {
    test('calcula a idade corretamente quando já fez anos este ano', () {
      final idade = calcularIdadeAnos(DateTime(1950, 1, 1), agora: DateTime(2026, 7, 9));
      expect(idade, 76);
    });

    test('não conta o ano atual se ainda não fez anos', () {
      final idade = calcularIdadeAnos(DateTime(1950, 12, 31), agora: DateTime(2026, 7, 9));
      expect(idade, 75);
    });
  });

  group('classificarFrequenciaCardiaca', () {
    test('usa o intervalo de adulto quando a idade não é conhecida', () {
      expect(classificarFrequenciaCardiaca(80), FaixaFrequenciaCardiaca.normal);
      expect(classificarFrequenciaCardiaca(50), FaixaFrequenciaCardiaca.baixa);
      expect(classificarFrequenciaCardiaca(120), FaixaFrequenciaCardiaca.elevada);
    });

    test('classifica um idoso com o intervalo de adulto (60-100)', () {
      expect(classificarFrequenciaCardiaca(70, idadeAnos: 78), FaixaFrequenciaCardiaca.normal);
      expect(classificarFrequenciaCardiaca(55, idadeAnos: 78), FaixaFrequenciaCardiaca.baixa);
      expect(classificarFrequenciaCardiaca(105, idadeAnos: 78), FaixaFrequenciaCardiaca.elevada);
    });

    test('limites do intervalo contam como normal', () {
      expect(classificarFrequenciaCardiaca(60), FaixaFrequenciaCardiaca.normal);
      expect(classificarFrequenciaCardiaca(100), FaixaFrequenciaCardiaca.normal);
    });
  });

  group('labelFaixaFrequenciaCardiaca', () {
    test('devolve o rótulo certo para cada faixa', () {
      expect(labelFaixaFrequenciaCardiaca(_l10n, FaixaFrequenciaCardiaca.baixa), 'Baixa');
      expect(labelFaixaFrequenciaCardiaca(_l10n, FaixaFrequenciaCardiaca.normal), 'Normal');
      expect(labelFaixaFrequenciaCardiaca(_l10n, FaixaFrequenciaCardiaca.elevada), 'Elevada');
    });
  });
}
