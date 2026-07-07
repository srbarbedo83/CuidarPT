import 'package:cuidarpt/data/models/registo_consulta.dart';
import 'package:cuidarpt/features/consultas/services/profissionais.dart';
import 'package:flutter_test/flutter_test.dart';

RegistoConsulta _consulta({required String especialidade, String? nomeMedico}) {
  return RegistoConsulta()
    ..idosoId = 1
    ..especialidade = especialidade
    ..nomeMedico = nomeMedico
    ..dataHora = DateTime(2026, 1, 1)
    ..criadoEm = DateTime(2026, 1, 1)
    ..atualizadoEm = DateTime(2026, 1, 1);
}

void main() {
  group('profissionaisDoIdoso', () {
    test('ignora consultas sem nome de médico/profissional', () {
      final consultas = [_consulta(especialidade: 'Cardiologia')];

      expect(profissionaisDoIdoso(consultas), isEmpty);
    });

    test('agrupa especialidades pelo mesmo profissional', () {
      final consultas = [
        _consulta(especialidade: 'Cardiologia', nomeMedico: 'Dr. António Silva'),
        _consulta(especialidade: 'Clínica geral', nomeMedico: 'Dr. António Silva'),
      ];

      final profissionais = profissionaisDoIdoso(consultas);

      expect(profissionais, hasLength(1));
      expect(profissionais.single.nome, 'Dr. António Silva');
      expect(profissionais.single.especialidades, {'Cardiologia', 'Clínica geral'});
    });

    test('ordena por nome', () {
      final consultas = [
        _consulta(especialidade: 'Cardiologia', nomeMedico: 'Zé Manel'),
        _consulta(especialidade: 'Clínica geral', nomeMedico: 'Ana Costa'),
      ];

      final profissionais = profissionaisDoIdoso(consultas);

      expect(profissionais.map((p) => p.nome), ['Ana Costa', 'Zé Manel']);
    });
  });
}
