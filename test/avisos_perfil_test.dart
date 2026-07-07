import 'package:cuidarpt/data/models/contacto_emergencia.dart';
import 'package:cuidarpt/data/models/idoso.dart';
import 'package:cuidarpt/features/idosos/services/avisos_perfil.dart';
import 'package:flutter_test/flutter_test.dart';

Idoso _idoso() {
  final agora = DateTime.now();
  return Idoso()
    ..nome = 'Ana'
    ..criadoEm = agora
    ..atualizadoEm = agora;
}

void main() {
  group('avisosPerfilIncompleto', () {
    test('avisa sobre contacto de emergência e data de nascimento em falta', () {
      final idoso = _idoso();

      expect(
        avisosPerfilIncompleto(idoso),
        containsAll(['Sem contacto de emergência', 'Sem data de nascimento']),
      );
    });

    test('não avisa quando há contacto de emergência e data de nascimento', () {
      final idoso = _idoso()
        ..dataNascimento = DateTime(1950, 1, 1)
        ..contactosEmergencia = [ContactoEmergencia()..telefone = '910000000'];

      expect(avisosPerfilIncompleto(idoso), isEmpty);
    });

    test('contacto vazio (sem nome nem telefone) conta como sem contacto', () {
      final idoso = _idoso()
        ..dataNascimento = DateTime(1950, 1, 1)
        ..contactosEmergencia = [ContactoEmergencia()];

      expect(avisosPerfilIncompleto(idoso), ['Sem contacto de emergência']);
    });
  });
}
