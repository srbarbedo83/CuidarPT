import 'package:isar_community/isar.dart';

part 'registo_consulta.g.dart';

@collection
class RegistoConsulta {
  Id id = Isar.autoIncrement;

  @Index()
  late int idosoId;

  /// Ex.: "Clínica geral", "Cardiologia", "Ortopedia".
  late String especialidade;

  /// Texto livre — ex.: "Centro de Saúde", "Hospital", "Clínica privada".
  String? local;

  /// Data e hora da consulta. Pode ser no passado (registo histórico) ou
  /// no futuro (consulta agendada, com lembrete).
  late DateTime dataHora;

  String? notas;

  /// Data prevista de uma consulta de seguimento, se o médico a marcou.
  DateTime? proximaConsultaData;

  /// Permite desligar os lembretes sem apagar o registo.
  bool lembreteAtivo = true;

  /// IDs dos lembretes agendados (consulta e/ou próxima consulta, se
  /// ambas forem futuras). Ver [ConsultaScheduler].
  List<int> notificacaoIds = [];

  late DateTime criadoEm;
  late DateTime atualizadoEm;
}
