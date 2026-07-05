import 'package:flutter_test/flutter_test.dart';

import 'package:cuidarpt/features/tempo/models/aviso_meteorologico.dart';
import 'package:cuidarpt/features/tempo/services/ipma_service.dart';

void main() {
  group('parseLocalidades', () {
    test('interpreta entradas válidas e ignora as incompletas', () {
      const corpo = '''
      [
        {"globalIdLocal": 1110600, "local": "Lisboa", "idAreaAviso": "LSB", "idConcelho": 1106, "idDistrito": 11},
        {"globalIdLocal": 1131200, "local": "Porto", "idAreaAviso": "PRT"},
        {"local": "Sem id global", "idAreaAviso": "XXX"},
        {"globalIdLocal": 9999999, "idAreaAviso": "YYY"}
      ]
      ''';

      final localidades = parseLocalidades(corpo);

      expect(localidades, hasLength(2));
      expect(localidades.first.nome, 'Lisboa');
      expect(localidades.first.globalIdLocal, 1110600);
      expect(localidades.first.idAreaAviso, 'LSB');
      expect(localidades.last.nome, 'Porto');
    });

    test('lista vazia não rebenta', () {
      expect(parseLocalidades('[]'), isEmpty);
    });
  });

  group('parsePrevisao', () {
    test('interpreta o formato com data envolvente {"data": [...]}', () {
      const corpo = '''
      {
        "owner": "IPMA",
        "globalIdLocal": 1110600,
        "dataUpdate": "2026-07-05T12:00:00",
        "data": [
          {"forecastDate": "2026-07-07", "tMin": "16.0", "tMax": "27.0", "precipitaProb": "10.0"},
          {"forecastDate": "2026-07-06", "tMin": "15.5", "tMax": "26.0", "precipitaProb": "0.0"}
        ]
      }
      ''';

      final previsao = parsePrevisao(corpo);

      expect(previsao, hasLength(2));
      // Ordenado por data ascendente, apesar da ordem inversa no JSON.
      expect(previsao.first.data, DateTime.parse('2026-07-06'));
      expect(previsao.first.tMin, 15.5);
      expect(previsao.first.tMax, 26.0);
      expect(previsao.last.data, DateTime.parse('2026-07-07'));
    });

    test('ignora entradas sem data válida', () {
      const corpo = '{"data": [{"tMin": "10.0"}]}';
      expect(parsePrevisao(corpo), isEmpty);
    });

    test('lança IpmaException para um formato completamente inesperado', () {
      expect(() => parsePrevisao('{"foo": "bar"}'), throwsA(isA<IpmaException>()));
    });
  });

  group('parseAvisos', () {
    test('filtra por idAreaAviso e ignora o nível "green"', () {
      const corpo = '''
      [
        {"idAreaAviso": "LSB", "awarenessTypeName": "Temperatura Alta", "awarenessLevelID": "orange",
         "startTime": "2026-07-06T00:00:00", "endTime": "2026-07-07T00:00:00"},
        {"idAreaAviso": "LSB", "awarenessTypeName": "Vento", "awarenessLevelID": "green",
         "startTime": "2026-07-06T00:00:00", "endTime": "2026-07-07T00:00:00"},
        {"idAreaAviso": "PRT", "awarenessTypeName": "Chuva", "awarenessLevelID": "red",
         "startTime": "2026-07-06T00:00:00", "endTime": "2026-07-07T00:00:00"}
      ]
      ''';

      final avisos = parseAvisos(corpo, 'LSB');

      expect(avisos, hasLength(1));
      expect(avisos.first.tipo, 'Temperatura Alta');
      expect(avisos.first.nivel, NivelAviso.laranja);
    });

    test('sem avisos para a área devolve lista vazia', () {
      const corpo = '[{"idAreaAviso": "PRT", "awarenessTypeName": "Chuva", "awarenessLevelID": "red", '
          '"startTime": "2026-07-06T00:00:00", "endTime": "2026-07-07T00:00:00"}]';

      expect(parseAvisos(corpo, 'LSB'), isEmpty);
    });
  });
}
