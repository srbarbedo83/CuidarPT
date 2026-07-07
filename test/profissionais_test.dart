import 'package:cuidarpt/data/models/info_profissional.dart';
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

    test('junta contacto e notas guardados para o profissional', () {
      final consultas = [_consulta(especialidade: 'Cardiologia', nomeMedico: 'Dr. António Silva')];
      final infos = [
        InfoProfissional()
          ..idosoId = 1
          ..nome = 'Dr. António Silva'
          ..contacto = '912345678'
          ..notas = 'Prefere ligações de manhã',
      ];

      final profissionais = profissionaisDoIdoso(consultas, infos: infos);

      expect(profissionais.single.contacto, '912345678');
      expect(profissionais.single.notas, 'Prefere ligações de manhã');
    });

    test('profissional sem info guardada fica com contacto e notas nulos', () {
      final consultas = [_consulta(especialidade: 'Cardiologia', nomeMedico: 'Dr. António Silva')];

      final profissionais = profissionaisDoIdoso(consultas);

      expect(profissionais.single.contacto, isNull);
      expect(profissionais.single.notas, isNull);
    });

    test('junta instituição e especialidade manual, complementando as detetadas', () {
      final consultas = [_consulta(especialidade: 'Cardiologia', nomeMedico: 'Dr. António Silva')];
      final infos = [
        InfoProfissional()
          ..idosoId = 1
          ..nome = 'Dr. António Silva'
          ..instituicao = 'Hospital de Santa Maria'
          ..especialidade = 'Medicina Interna',
      ];

      final profissionais = profissionaisDoIdoso(consultas, infos: infos);

      expect(profissionais.single.instituicao, 'Hospital de Santa Maria');
      expect(profissionais.single.especialidadeManual, 'Medicina Interna');
      expect(profissionais.single.especialidades, {'Cardiologia', 'Medicina Interna'});
    });
  });
}
