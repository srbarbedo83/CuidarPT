import 'package:isar_community/isar.dart';

part 'registo_cuidado_diario.g.dart';

enum TipoCuidadoDiario { higiene, alimentacao, humor, sono, outro }

@collection
class RegistoCuidadoDiario {
  Id id = Isar.autoIncrement;

  @Index()
  late int idosoId;

  @Enumerated(EnumType.name)
  late TipoCuidadoDiario tipo;

  String? notaRapida;

  /// Só usado quando `tipo == TipoCuidadoDiario.humor`, de 1 (mau) a 5 (ótimo).
  int? humorNivel;

  @Index()
  late DateTime timestamp;
}
