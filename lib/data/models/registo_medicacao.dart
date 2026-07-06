import 'package:isar_community/isar.dart';

part 'registo_medicacao.g.dart';

@collection
class RegistoMedicacao {
  Id id = Isar.autoIncrement;

  @Index()
  late int idosoId;

  /// Ex.: "Paracetamol 500mg".
  late String nomeMedicamento;

  /// Texto livre: "1 comprimido", "500 mg", "10 gotas".
  String? dose;

  /// Horários de toma, em minutos desde a meia-noite (0-1439).
  List<int> horariosMinutos = [];

  /// Dias da semana em que a medicação é tomada, 1 (segunda) a 7 (domingo).
  /// Vazio significa todos os dias.
  List<int> diasSemana = [];

  DateTime? dataInicio;
  DateTime? dataFim;

  /// IDs dos lembretes agendados no `flutter_local_notifications`, para
  /// poderem ser cancelados/reagendados (ver [MedicacaoScheduler]).
  List<int> notificacaoIds = [];

  /// Permite pausar a medicação (e os seus lembretes) sem apagar o registo.
  bool ativo = true;

  String? notas;

  late DateTime criadoEm;
  late DateTime atualizadoEm;
}
