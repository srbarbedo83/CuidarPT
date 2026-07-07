import 'package:isar_community/isar.dart';

part 'registo_sinais_vitais.g.dart';

/// Registo de sinais vitais do idoso num dado momento (funcionalidade
/// Premium). Todos os valores são opcionais — regista-se só o que foi
/// medido.
@collection
class RegistoSinaisVitais {
  Id id = Isar.autoIncrement;

  @Index()
  late int idosoId;

  /// mmHg.
  int? pressaoSistolica;
  int? pressaoDiastolica;

  /// Graus Celsius.
  double? temperatura;

  /// mg/dL.
  int? glicemia;

  /// Batimentos por minuto.
  int? frequenciaCardiaca;

  String? notas;

  @Index()
  late DateTime timestamp;
}
