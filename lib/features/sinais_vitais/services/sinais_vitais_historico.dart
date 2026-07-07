import '../../../data/models/registo_sinais_vitais.dart';

class PontoSinalVital {
  const PontoSinalVital({required this.dia, required this.media});

  final DateTime dia;

  /// Média do sinal vital nesse dia, `null` se não houver registos.
  final double? media;
}

/// Calcula a média diária de um sinal vital (escolhido por [valor]) dos
/// últimos [dias] (incluindo hoje), a partir dos registos de sinais vitais.
List<PontoSinalVital> sinalVitalPorDia(
  List<RegistoSinaisVitais> registos, {
  required int dias,
  required num? Function(RegistoSinaisVitais registo) valor,
  DateTime? agora,
}) {
  final referencia = agora ?? DateTime.now();
  final hoje = DateTime(referencia.year, referencia.month, referencia.day);

  final valoresPorDia = <DateTime, List<num>>{};
  for (final registo in registos) {
    final valorRegisto = valor(registo);
    if (valorRegisto == null) continue;
    final timestamp = registo.timestamp;
    final dia = DateTime(timestamp.year, timestamp.month, timestamp.day);
    valoresPorDia.putIfAbsent(dia, () => []).add(valorRegisto);
  }

  return [
    for (var offset = dias - 1; offset >= 0; offset--) _pontoDoDia(hoje, offset, valoresPorDia),
  ];
}

PontoSinalVital _pontoDoDia(DateTime hoje, int offset, Map<DateTime, List<num>> valoresPorDia) {
  final dia = hoje.subtract(Duration(days: offset));
  final valores = valoresPorDia[dia];
  final media = (valores == null || valores.isEmpty)
      ? null
      : valores.reduce((a, b) => a + b) / valores.length;
  return PontoSinalVital(dia: dia, media: media?.toDouble());
}

/// Média geral dos pontos com valor (ignora dias sem registo).
double? mediaSinalVital(List<PontoSinalVital> pontos) {
  final valores = pontos.map((p) => p.media).whereType<double>().toList();
  if (valores.isEmpty) return null;
  return valores.reduce((a, b) => a + b) / valores.length;
}
