import 'dart:math';

import '../../../data/models/registo_frequencia_cardiaca.dart';

class PontoFrequenciaCardiaca {
  const PontoFrequenciaCardiaca({
    required this.dia,
    required this.media,
    required this.minimo,
    required this.maximo,
  });

  final DateTime dia;

  /// Média de BPM nesse dia, `null` se não houver medições.
  final double? media;
  final int? minimo;
  final int? maximo;
}

enum TendenciaFrequenciaCardiaca { subida, descida, estavel }

/// Calcula a média/mínimo/máximo diários de BPM dos últimos [dias]
/// (incluindo hoje), a partir do histórico de medições.
List<PontoFrequenciaCardiaca> pontosFrequenciaCardiaca(
  List<RegistoFrequenciaCardiaca> registos, {
  required int dias,
  DateTime? agora,
}) {
  final referencia = agora ?? DateTime.now();
  final hoje = DateTime(referencia.year, referencia.month, referencia.day);

  final bpmsPorDia = <DateTime, List<int>>{};
  for (final registo in registos) {
    final timestamp = registo.timestamp;
    final dia = DateTime(timestamp.year, timestamp.month, timestamp.day);
    bpmsPorDia.putIfAbsent(dia, () => []).add(registo.bpm);
  }

  return [
    for (var offset = dias - 1; offset >= 0; offset--) _pontoDoDia(hoje, offset, bpmsPorDia),
  ];
}

PontoFrequenciaCardiaca _pontoDoDia(DateTime hoje, int offset, Map<DateTime, List<int>> bpmsPorDia) {
  final dia = hoje.subtract(Duration(days: offset));
  final bpms = bpmsPorDia[dia];
  if (bpms == null || bpms.isEmpty) {
    return PontoFrequenciaCardiaca(dia: dia, media: null, minimo: null, maximo: null);
  }
  return PontoFrequenciaCardiaca(
    dia: dia,
    media: bpms.reduce((a, b) => a + b) / bpms.length,
    minimo: bpms.reduce(min),
    maximo: bpms.reduce(max),
  );
}

double? mediaFrequenciaCardiaca(List<PontoFrequenciaCardiaca> pontos) {
  final valores = pontos.map((p) => p.media).whereType<double>().toList();
  if (valores.isEmpty) return null;
  return valores.reduce((a, b) => a + b) / valores.length;
}

int? minimoFrequenciaCardiaca(List<PontoFrequenciaCardiaca> pontos) {
  final valores = pontos.map((p) => p.minimo).whereType<int>().toList();
  if (valores.isEmpty) return null;
  return valores.reduce(min);
}

int? maximoFrequenciaCardiaca(List<PontoFrequenciaCardiaca> pontos) {
  final valores = pontos.map((p) => p.maximo).whereType<int>().toList();
  if (valores.isEmpty) return null;
  return valores.reduce(max);
}

/// Compara a média da primeira metade do período com a segunda metade para
/// indicar se a frequência cardíaca tem vindo a subir, descer ou a
/// manter-se estável (diferenças pequenas, dentro do ruído normal).
TendenciaFrequenciaCardiaca? calcularTendencia(List<PontoFrequenciaCardiaca> pontos) {
  final comValor = pontos.where((p) => p.media != null).toList();
  if (comValor.length < 2) return null;

  final metade = comValor.length ~/ 2;
  final primeiraMetade = comValor.sublist(0, metade);
  final segundaMetade = comValor.sublist(comValor.length - metade);

  final mediaPrimeira = primeiraMetade.map((p) => p.media!).reduce((a, b) => a + b) / primeiraMetade.length;
  final mediaSegunda = segundaMetade.map((p) => p.media!).reduce((a, b) => a + b) / segundaMetade.length;

  const limiarEstavel = 3.0;
  final diferenca = mediaSegunda - mediaPrimeira;
  if (diferenca > limiarEstavel) return TendenciaFrequenciaCardiaca.subida;
  if (diferenca < -limiarEstavel) return TendenciaFrequenciaCardiaca.descida;
  return TendenciaFrequenciaCardiaca.estavel;
}

String labelTendenciaFrequenciaCardiaca(TendenciaFrequenciaCardiaca tendencia) {
  return switch (tendencia) {
    TendenciaFrequenciaCardiaca.subida => 'Em subida',
    TendenciaFrequenciaCardiaca.descida => 'Em descida',
    TendenciaFrequenciaCardiaca.estavel => 'Estável',
  };
}
