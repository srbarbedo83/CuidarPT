import 'package:isar_community/isar.dart';

part 'registo_consulta.g.dart';

enum TipoRegistoConsulta { consulta, tratamento }

@collection
class RegistoConsulta {
  Id id = Isar.autoIncrement;

  @Index()
  late int idosoId;

  @Enumerated(EnumType.name)
  TipoRegistoConsulta tipo = TipoRegistoConsulta.consulta;

  /// Para consultas: especialidade (ex.: "Cardiologia"). Para tratamentos:
  /// o próprio nome do tratamento (ex.: "Fisioterapia", "Penso").
  late String especialidade;

  /// Texto livre — ex.: "Centro de Saúde", "Hospital", "Clínica privada".
  String? local;

  /// Nome do médico, opcional.
  String? nomeMedico;

  /// Data e hora da consulta. Pode ser no passado (registo histórico) ou
  /// no futuro (consulta agendada, com lembrete).
  late DateTime dataHora;

  String? notas;

  /// Data prevista de uma consulta de seguimento, se o médico a marcou.
  /// Só usado quando [recorrente] é `false`.
  DateTime? proximaConsultaData;

  /// Só aplicável a tratamentos: repete-se diariamente (ou nos dias de
  /// [diasSemanaRecorrencia]) à hora de [dataHora], em vez de ser um
  /// compromisso pontual.
  bool recorrente = false;

  /// Dias da semana da recorrência, 1 (segunda) a 7 (domingo). Vazio
  /// significa todos os dias.
  List<int> diasSemanaRecorrencia = [];

  /// Permite desligar os lembretes sem apagar o registo.
  bool lembreteAtivo = true;

  /// IDs dos lembretes agendados (consulta e/ou próxima consulta, se
  /// ambas forem futuras). Ver [ConsultaScheduler].
  List<int> notificacaoIds = [];

  late DateTime criadoEm;
  late DateTime atualizadoEm;
}
