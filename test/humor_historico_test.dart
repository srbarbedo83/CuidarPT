import 'package:cuidarpt/data/models/registo_cuidado_diario.dart';
import 'package:cuidarpt/features/cuidados_diarios/services/humor_historico.dart';
import 'package:flutter_test/flutter_test.dart';

RegistoCuidadoDiario _humor(DateTime timestamp, int nivel) {
  return RegistoCuidadoDiario()
    ..idosoId = 1
    ..tipo = TipoCuidadoDiario.humor
    ..humorNivel = nivel
    ..timestamp = timestamp;
}

void main() {
  group('humorPorDia', () {
    final hoje = DateTime(2026, 7, 6);

    test('devolve um ponto por dia, do mais antigo para o mais recente', () {
      final pontos = humorPorDia([], dias: 7, agora: hoje);

      expect(pontos, hasLength(7));
      expect(pontos.first.dia, DateTime(2026, 6, 30));
      expect(pontos.last.dia, hoje);
      expect(pontos.every((p) => p.media == null), isTrue);
    });

    test('calcula a média quando há vários registos no mesmo dia', () {
      final cuidados = [_humor(hoje, 2), _humor(hoje, 4)];

      final pontos = humorPorDia(cuidados, dias: 7, agora: hoje);

      expect(pontos.last.media, 3.0);
    });

    test('ignora cuidados que não são de tipo humor ou sem nível', () {
      final cuidados = [
        RegistoCuidadoDiario()
          ..idosoId = 1
          ..tipo = TipoCuidadoDiario.higiene
          ..timestamp = hoje,
        _humor(hoje, 5),
      ];

      final pontos = humorPorDia(cuidados, dias: 7, agora: hoje);

      expect(pontos.last.media, 5.0);
    });

    test('só inclui registos dentro da janela de dias pedida', () {
      final foraDaJanela = _humor(hoje.subtract(const Duration(days: 10)), 1);

      final pontos = humorPorDia([foraDaJanela], dias: 7, agora: hoje);

      expect(pontos.every((p) => p.media == null), isTrue);
    });
  });
}
