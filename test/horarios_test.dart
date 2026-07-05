import 'package:cuidarpt/core/utils/horarios.dart';
import 'package:flutter_test/flutter_test.dart';

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
      expect(formatarDiasSemana([]), 'Todos os dias');
    });

    test('ordena e abrevia os dias escolhidos', () {
      expect(formatarDiasSemana([5, 1, 3]), 'Seg, Qua, Sex');
    });
  });
}
