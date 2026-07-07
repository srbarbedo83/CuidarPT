import 'package:flutter/material.dart' show DateTimeRange;

enum PeriodoRelatorio { hoje, ultimos7Dias, ultimos30Dias, personalizado }

/// Calcula o intervalo [inicio, fim] do relatório para o [periodo] escolhido.
/// [agora] só existe para tornar a função testável — por omissão usa a data
/// atual.
({DateTime inicio, DateTime fim}) calcularIntervaloRelatorio(
  PeriodoRelatorio periodo, {
  DateTimeRange? personalizado,
  DateTime? agora,
}) {
  final referencia = agora ?? DateTime.now();
  final fimDoDia = DateTime(referencia.year, referencia.month, referencia.day, 23, 59, 59);
  final inicioDoDia = DateTime(referencia.year, referencia.month, referencia.day);

  switch (periodo) {
    case PeriodoRelatorio.hoje:
      return (inicio: inicioDoDia, fim: fimDoDia);
    case PeriodoRelatorio.ultimos7Dias:
      return (inicio: fimDoDia.subtract(const Duration(days: 7)), fim: fimDoDia);
    case PeriodoRelatorio.ultimos30Dias:
      return (inicio: fimDoDia.subtract(const Duration(days: 30)), fim: fimDoDia);
    case PeriodoRelatorio.personalizado:
      if (personalizado == null) {
        return (inicio: fimDoDia.subtract(const Duration(days: 7)), fim: fimDoDia);
      }
      return (
        inicio: DateTime(personalizado.start.year, personalizado.start.month, personalizado.start.day),
        fim: DateTime(personalizado.end.year, personalizado.end.month, personalizado.end.day, 23, 59, 59),
      );
  }
}
