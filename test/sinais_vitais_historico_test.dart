import 'package:cuidarpt/data/models/registo_sinais_vitais.dart';
import 'package:cuidarpt/features/sinais_vitais/services/sinais_vitais_historico.dart';
import 'package:flutter_test/flutter_test.dart';

RegistoSinaisVitais _registo(DateTime timestamp, {int? frequenciaCardiaca}) {
  return RegistoSinaisVitais()
    ..idosoId = 1
    ..frequenciaCardiaca = frequenciaCardiaca
    ..timestamp = timestamp;
}

void main() {
  group('sinalVitalPorDia', () {
    final hoje = DateTime(2026, 7, 6);

    test('devolve um ponto por dia, do mais antigo para o mais recente', () {
      final pontos = sinalVitalPorDia(
        [],
        dias: 7,
        valor: (r) => r.frequenciaCardiaca,
        agora: hoje,
      );

      expect(pontos, hasLength(7));
      expect(pontos.first.dia, DateTime(2026, 6, 30));
      expect(pontos.last.dia, hoje);
      expect(pontos.every((p) => p.media == null), isTrue);
    });

    test('calcula a média quando há vários registos no mesmo dia', () {
      final registos = [
        _registo(hoje, frequenciaCardiaca: 60),
        _registo(hoje, frequenciaCardiaca: 80),
      ];

      final pontos = sinalVitalPorDia(registos, dias: 7, valor: (r) => r.frequenciaCardiaca, agora: hoje);

      expect(pontos.last.media, 70.0);
    });

    test('ignora registos sem o valor pedido', () {
      final registos = [_registo(hoje), _registo(hoje, frequenciaCardiaca: 90)];

      final pontos = sinalVitalPorDia(registos, dias: 7, valor: (r) => r.frequenciaCardiaca, agora: hoje);

      expect(pontos.last.media, 90.0);
    });

    test('só inclui registos dentro da janela de dias pedida', () {
      final foraDaJanela = _registo(hoje.subtract(const Duration(days: 10)), frequenciaCardiaca: 100);

      final pontos = sinalVitalPorDia([foraDaJanela], dias: 7, valor: (r) => r.frequenciaCardiaca, agora: hoje);

      expect(pontos.every((p) => p.media == null), isTrue);
    });
  });

  group('mediaSinalVital', () {
    test('devolve null quando não há nenhum ponto com valor', () {
      final pontos = sinalVitalPorDia([], dias: 7, valor: (r) => r.frequenciaCardiaca, agora: DateTime(2026, 7, 6));

      expect(mediaSinalVital(pontos), isNull);
    });

    test('calcula a média dos dias com valor, ignorando dias sem registo', () {
      final hoje = DateTime(2026, 7, 6);
      final registos = [_registo(hoje, frequenciaCardiaca: 60), _registo(hoje.subtract(const Duration(days: 1)), frequenciaCardiaca: 80)];

      final pontos = sinalVitalPorDia(registos, dias: 7, valor: (r) => r.frequenciaCardiaca, agora: hoje);

      expect(mediaSinalVital(pontos), 70.0);
    });
  });
}
