import 'package:cuidarpt/core/utils/horarios.dart';
import 'package:cuidarpt/l10n/app_localizations_pt.dart';
import 'package:flutter_test/flutter_test.dart';

final _l10n = AppLocalizationsPt();

void main() {
  group('formatarHorario', () {
    test('formata minutos como HH:mm com zeros à esquerda', () {
      expect(formatarHorario(0), '00:00');
      expect(formatarHorario(90), '01:30');
      expect(formatarHorario(1439), '23:59');
    });
  });

  group('formatarDiasSemana', () {
    test('lista vazia significa todos os dias', () {
      expect(formatarDiasSemana(_l10n, []), 'Todos os dias');
    });

    test('ordena e abrevia os dias escolhidos', () {
      expect(formatarDiasSemana(_l10n, [5, 1, 3]), 'Seg, Qua, Sex');
    });
  });
}
