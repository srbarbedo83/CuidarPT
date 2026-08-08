import '../../l10n/app_localizations.dart';

Map<int, String> diasSemanaAbreviados(AppLocalizations l10n) => {
      1: l10n.diaSegAbrev,
      2: l10n.diaTerAbrev,
      3: l10n.diaQuaAbrev,
      4: l10n.diaQuiAbrev,
      5: l10n.diaSexAbrev,
      6: l10n.diaSabAbrev,
      7: l10n.diaDomAbrev,
    };

String formatarHorario(int minutosDesdeMeiaNoite) {
  final hora = (minutosDesdeMeiaNoite ~/ 60).toString().padLeft(2, '0');
  final minuto = (minutosDesdeMeiaNoite % 60).toString().padLeft(2, '0');
  return '$hora:$minuto';
}

String formatarDiasSemana(AppLocalizations l10n, List<int> diasSemana) {
  if (diasSemana.isEmpty) return l10n.horariosTodosDias;
  final abreviados = diasSemanaAbreviados(l10n);
  final ordenados = [...diasSemana]..sort();
  return ordenados.map((dia) => abreviados[dia] ?? '?').join(', ');
}
