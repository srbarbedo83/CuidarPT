import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cuidarpt/features/relatorios/services/periodo_relatorio.dart';

void main() {
  final agora = DateTime(2026, 7, 15, 10, 30);

  group('calcularIntervaloRelatorio', () {
    test('últimos 7 dias termina hoje e começa 7 dias antes', () {
      final intervalo = calcularIntervaloRelatorio(PeriodoRelatorio.ultimos7Dias, agora: agora);

      expect(intervalo.fim, DateTime(2026, 7, 15, 23, 59, 59));
      expect(intervalo.inicio, DateTime(2026, 7, 8, 23, 59, 59));
    });

    test('últimos 30 dias começa 30 dias antes de hoje', () {
      final intervalo = calcularIntervaloRelatorio(PeriodoRelatorio.ultimos30Dias, agora: agora);

      expect(intervalo.fim, DateTime(2026, 7, 15, 23, 59, 59));
      expect(intervalo.inicio, DateTime(2026, 6, 15, 23, 59, 59));
    });

    test('personalizado usa o intervalo escolhido, início à meia-noite e fim ao fim do dia', () {
      final intervalo = calcularIntervaloRelatorio(
        PeriodoRelatorio.personalizado,
        agora: agora,
        personalizado: DateTimeRange(start: DateTime(2026, 1, 1), end: DateTime(2026, 1, 10)),
      );

      expect(intervalo.inicio, DateTime(2026, 1, 1));
      expect(intervalo.fim, DateTime(2026, 1, 10, 23, 59, 59));
    });

    test('personalizado sem intervalo escolhido cai de volta para os últimos 7 dias', () {
      final semPersonalizado = calcularIntervaloRelatorio(PeriodoRelatorio.personalizado, agora: agora);
      final ultimos7Dias = calcularIntervaloRelatorio(PeriodoRelatorio.ultimos7Dias, agora: agora);

      expect(semPersonalizado, ultimos7Dias);
    });
  });
}
