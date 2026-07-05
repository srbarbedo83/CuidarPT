import 'package:cuidarpt/core/services/notification_ids.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NotificationIds', () {
    test('medicação e consulta nunca colidem para o mesmo id numérico', () {
      for (var id = 1; id <= 50; id++) {
        for (var indiceMedicacao = 0; indiceMedicacao < 5; indiceMedicacao++) {
          for (var indiceConsulta = 0; indiceConsulta < 2; indiceConsulta++) {
            expect(
              NotificationIds.medicacao(id, indiceMedicacao),
              isNot(NotificationIds.consulta(id, indiceConsulta)),
            );
          }
        }
      }
    });

    test('IDs diferentes para registos diferentes', () {
      expect(NotificationIds.medicacao(1, 0), isNot(NotificationIds.medicacao(2, 0)));
      expect(NotificationIds.consulta(1, 0), isNot(NotificationIds.consulta(2, 0)));
    });

    test('é determinístico (mesmo id e índice produzem sempre o mesmo resultado)', () {
      expect(NotificationIds.medicacao(7, 2), NotificationIds.medicacao(7, 2));
      expect(NotificationIds.consulta(7, 1), NotificationIds.consulta(7, 1));
    });
  });
}
