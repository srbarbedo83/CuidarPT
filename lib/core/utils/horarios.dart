const diasSemanaAbreviados = {
  1: 'Seg',
  2: 'Ter',
  3: 'Qua',
  4: 'Qui',
  5: 'Sex',
  6: 'Sáb',
  7: 'Dom',
};

String formatarHorario(int minutosDesdeMeiaNoite) {
  final hora = (minutosDesdeMeiaNoite ~/ 60).toString().padLeft(2, '0');
  final minuto = (minutosDesdeMeiaNoite % 60).toString().padLeft(2, '0');
  return '$hora:$minuto';
}

String formatarDiasSemana(List<int> diasSemana) {
  if (diasSemana.isEmpty) return 'Todos os dias';
  final ordenados = [...diasSemana]..sort();
  return ordenados.map((dia) => diasSemanaAbreviados[dia] ?? '?').join(', ');
}
