import 'package:flutter_test/flutter_test.dart';

import 'package:cuidarpt/data/models/registo_consulta.dart';
import 'package:cuidarpt/data/models/registo_cuidado_diario.dart';
import 'package:cuidarpt/data/models/registo_medicacao.dart';
import 'package:cuidarpt/features/calendario/services/eventos_calendario.dart';

void main() {
  final agora = DateTime.now();

  RegistoMedicacao medicacao({
    List<int> diasSemana = const [],
    bool ativo = true,
    DateTime? dataInicio,
    DateTime? dataFim,
    List<int> horariosMinutos = const [480],
  }) {
    return RegistoMedicacao()
      ..id = 1
      ..idosoId = 1
      ..nomeMedicamento = 'Paracetamol'
      ..diasSemana = diasSemana
      ..ativo = ativo
      ..dataInicio = dataInicio
      ..dataFim = dataFim
      ..horariosMinutos = horariosMinutos
      ..criadoEm = agora
      ..atualizadoEm = agora;
  }

  group('eventosDoDia — medicação', () {
    test('medicação diária (sem dias específicos) aparece em qualquer dia', () {
      final segunda = DateTime(2026, 7, 6); // segunda-feira
      final eventos = eventosDoDia(
        segunda,
        medicacoes: [medicacao()],
        consultas: const [],
        cuidados: const [],
      );

      expect(eventos, hasLength(1));
      expect(eventos.first.tipo, TipoEventoCalendario.medicacao);
    });

    test('medicação com dias específicos só aparece nesses dias da semana', () {
      final segunda = DateTime(2026, 7, 6);
      final terca = DateTime(2026, 7, 7);
      final registo = medicacao(diasSemana: [DateTime.monday]);

      expect(eventosDoDia(segunda, medicacoes: [registo], consultas: const [], cuidados: const []),
          hasLength(1));
      expect(eventosDoDia(terca, medicacoes: [registo], consultas: const [], cuidados: const []), isEmpty);
    });

    test('medicação pausada (ativo=false) não aparece', () {
      final segunda = DateTime(2026, 7, 6);
      final registo = medicacao(ativo: false);

      expect(eventosDoDia(segunda, medicacoes: [registo], consultas: const [], cuidados: const []), isEmpty);
    });

    test('medicação fora do período dataInicio/dataFim não aparece', () {
      final dia = DateTime(2026, 7, 6);
      final registo = medicacao(
        dataInicio: DateTime(2026, 8, 1),
        dataFim: DateTime(2026, 8, 31),
      );

      expect(eventosDoDia(dia, medicacoes: [registo], consultas: const [], cuidados: const []), isEmpty);
    });

    test('um evento por cada horário do dia', () {
      final segunda = DateTime(2026, 7, 6);
      final registo = medicacao(horariosMinutos: [480, 1200]);

      final eventos = eventosDoDia(segunda, medicacoes: [registo], consultas: const [], cuidados: const []);

      expect(eventos, hasLength(2));
      expect(eventos.map((e) => e.subtitulo), containsAll(['08:00', '20:00']));
    });
  });

  group('eventosDoDia — consultas e cuidados', () {
    test('consulta só aparece no dia exato da data/hora', () {
      final dia = DateTime(2026, 7, 6);
      final consulta = RegistoConsulta()
        ..id = 1
        ..idosoId = 1
        ..especialidade = 'Cardiologia'
        ..dataHora = DateTime(2026, 7, 6, 10, 30)
        ..criadoEm = agora
        ..atualizadoEm = agora;

      expect(
        eventosDoDia(dia, medicacoes: const [], consultas: [consulta], cuidados: const []),
        hasLength(1),
      );
      expect(
        eventosDoDia(DateTime(2026, 7, 7), medicacoes: const [], consultas: [consulta], cuidados: const []),
        isEmpty,
      );
    });

    test('tratamento recorrente diário aparece em qualquer dia a partir do início', () {
      final tratamento = RegistoConsulta()
        ..id = 2
        ..idosoId = 1
        ..tipo = TipoRegistoConsulta.tratamento
        ..especialidade = 'Fisioterapia'
        ..dataHora = DateTime(2026, 7, 6, 10, 0)
        ..recorrente = true
        ..criadoEm = agora
        ..atualizadoEm = agora;

      expect(
        eventosDoDia(DateTime(2026, 7, 10), medicacoes: const [], consultas: [tratamento], cuidados: const []),
        hasLength(1),
      );
      expect(
        eventosDoDia(DateTime(2026, 7, 5), medicacoes: const [], consultas: [tratamento], cuidados: const []),
        isEmpty,
      );
    });

    test('tratamento recorrente semanal só aparece nos dias escolhidos', () {
      final segunda = DateTime(2026, 7, 6);
      final terca = DateTime(2026, 7, 7);
      final tratamento = RegistoConsulta()
        ..id = 3
        ..idosoId = 1
        ..tipo = TipoRegistoConsulta.tratamento
        ..especialidade = 'Fisioterapia'
        ..dataHora = DateTime(2026, 7, 1, 10, 0)
        ..recorrente = true
        ..diasSemanaRecorrencia = [DateTime.monday]
        ..criadoEm = agora
        ..atualizadoEm = agora;

      expect(
        eventosDoDia(segunda, medicacoes: const [], consultas: [tratamento], cuidados: const []),
        hasLength(1),
      );
      expect(
        eventosDoDia(terca, medicacoes: const [], consultas: [tratamento], cuidados: const []),
        isEmpty,
      );
    });

    test('cuidado diário só aparece no dia exato do timestamp', () {
      final dia = DateTime(2026, 7, 6);
      final cuidado = RegistoCuidadoDiario()
        ..id = 1
        ..idosoId = 1
        ..tipo = TipoCuidadoDiario.higiene
        ..timestamp = DateTime(2026, 7, 6, 9);

      final eventos = eventosDoDia(dia, medicacoes: const [], consultas: const [], cuidados: [cuidado]);

      expect(eventos, hasLength(1));
      expect(eventos.first.tipo, TipoEventoCalendario.cuidado);
    });
  });
}
