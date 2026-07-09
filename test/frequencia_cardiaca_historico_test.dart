import 'package:flutter_test/flutter_test.dart';
import 'package:cuidarpt/data/models/registo_frequencia_cardiaca.dart';
import 'package:cuidarpt/features/frequencia_cardiaca/services/frequencia_cardiaca_historico.dart';

RegistoFrequenciaCardiaca _registo(DateTime timestamp, int bpm) {
  return RegistoFrequenciaCardiaca()
    ..idosoId = 1
    ..bpm = bpm
    ..fonte = FonteFrequenciaCardiaca.camera
    ..timestamp = timestamp;
}

void main() {
  final agora = DateTime(2026, 7, 9, 12);

  group('pontosFrequenciaCardiaca', () {
    test('devolve um ponto por dia, do mais antigo para o mais recente, sem registos', () {
      final pontos = pontosFrequenciaCardiaca(const [], dias: 3, agora: agora);

      expect(pontos, hasLength(3));
      expect(pontos.first.dia, DateTime(2026, 7, 7));
      expect(pontos.last.dia, DateTime(2026, 7, 9));
      expect(pontos.every((p) => p.media == null), isTrue);
    });

    test('calcula média, mínimo e máximo quando há várias medições no mesmo dia', () {
      final registos = [
        _registo(DateTime(2026, 7, 9, 8), 70),
        _registo(DateTime(2026, 7, 9, 20), 90),
      ];

      final pontos = pontosFrequenciaCardiaca(registos, dias: 1, agora: agora);

      expect(pontos.single.media, 80);
      expect(pontos.single.minimo, 70);
      expect(pontos.single.maximo, 90);
    });

    test('ignora medições fora da janela de dias pedida', () {
      final registos = [_registo(DateTime(2026, 6, 1), 100)];

      final pontos = pontosFrequenciaCardiaca(registos, dias: 7, agora: agora);

      expect(pontos.every((p) => p.media == null), isTrue);
    });
  });

  group('mediaFrequenciaCardiaca / minimoFrequenciaCardiaca / maximoFrequenciaCardiaca', () {
    test('devolvem null quando não há nenhum ponto com valor', () {
      final pontos = pontosFrequenciaCardiaca(const [], dias: 3, agora: agora);

      expect(mediaFrequenciaCardiaca(pontos), isNull);
      expect(minimoFrequenciaCardiaca(pontos), isNull);
      expect(maximoFrequenciaCardiaca(pontos), isNull);
    });

    test('calculam os valores dos dias com registo, ignorando dias sem medição', () {
      final registos = [
        _registo(DateTime(2026, 7, 8, 9), 60),
        _registo(DateTime(2026, 7, 9, 9), 100),
      ];

      final pontos = pontosFrequenciaCardiaca(registos, dias: 3, agora: agora);

      expect(mediaFrequenciaCardiaca(pontos), 80);
      expect(minimoFrequenciaCardiaca(pontos), 60);
      expect(maximoFrequenciaCardiaca(pontos), 100);
    });
  });

  group('calcularTendencia', () {
    test('devolve null com menos de 2 dias com valor', () {
      final registos = [_registo(DateTime(2026, 7, 9, 9), 70)];
      final pontos = pontosFrequenciaCardiaca(registos, dias: 5, agora: agora);

      expect(calcularTendencia(pontos), isNull);
    });

    test('deteta subida quando a segunda metade do período tem BPM bem mais alto', () {
      final registos = [
        _registo(DateTime(2026, 7, 5, 9), 65),
        _registo(DateTime(2026, 7, 6, 9), 65),
        _registo(DateTime(2026, 7, 8, 9), 95),
        _registo(DateTime(2026, 7, 9, 9), 95),
      ];
      final pontos = pontosFrequenciaCardiaca(registos, dias: 5, agora: agora);

      expect(calcularTendencia(pontos), TendenciaFrequenciaCardiaca.subida);
    });

    test('deteta descida quando a segunda metade do período tem BPM bem mais baixo', () {
      final registos = [
        _registo(DateTime(2026, 7, 5, 9), 95),
        _registo(DateTime(2026, 7, 6, 9), 95),
        _registo(DateTime(2026, 7, 8, 9), 65),
        _registo(DateTime(2026, 7, 9, 9), 65),
      ];
      final pontos = pontosFrequenciaCardiaca(registos, dias: 5, agora: agora);

      expect(calcularTendencia(pontos), TendenciaFrequenciaCardiaca.descida);
    });

    test('considera estável quando a diferença é pequena', () {
      final registos = [
        _registo(DateTime(2026, 7, 5, 9), 70),
        _registo(DateTime(2026, 7, 9, 9), 71),
      ];
      final pontos = pontosFrequenciaCardiaca(registos, dias: 5, agora: agora);

      expect(calcularTendencia(pontos), TendenciaFrequenciaCardiaca.estavel);
    });
  });
}
