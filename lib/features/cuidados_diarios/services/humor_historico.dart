import '../../../data/models/registo_cuidado_diario.dart';

class PontoHumor {
  const PontoHumor({required this.dia, required this.media});

  final DateTime dia;

  /// Média do humor nesse dia (1-5), `null` se não houver registos.
  final double? media;
}

/// Calcula a média diária de humor dos últimos [dias] (incluindo hoje), a
/// partir dos registos de cuidados diários de tipo [TipoCuidadoDiario.humor].
List<PontoHumor> humorPorDia(
  List<RegistoCuidadoDiario> cuidados, {
  required int dias,
  DateTime? agora,
}) {
  final referencia = agora ?? DateTime.now();
  final hoje = DateTime(referencia.year, referencia.month, referencia.day);

  final valoresPorDia = <DateTime, List<int>>{};
  for (final cuidado in cuidados) {
    if (cuidado.tipo != TipoCuidadoDiario.humor || cuidado.humorNivel == null) continue;
    final timestamp = cuidado.timestamp;
    final dia = DateTime(timestamp.year, timestamp.month, timestamp.day);
    valoresPorDia.putIfAbsent(dia, () => []).add(cuidado.humorNivel!);
  }

  return [
    for (var offset = dias - 1; offset >= 0; offset--) _pontoDoDia(hoje, offset, valoresPorDia),
  ];
}

PontoHumor _pontoDoDia(DateTime hoje, int offset, Map<DateTime, List<int>> valoresPorDia) {
  final dia = hoje.subtract(Duration(days: offset));
  final valores = valoresPorDia[dia];
  final media =
      (valores == null || valores.isEmpty) ? null : valores.reduce((a, b) => a + b) / valores.length;
  return PontoHumor(dia: dia, media: media);
}
