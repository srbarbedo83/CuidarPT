import 'package:isar_community/isar.dart';

part 'registo_cuidado_diario.g.dart';

enum TipoCuidadoDiario { higiene, alimentacao, humor, sono, atividade, outro }

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

  /// Preenchido quando este registo veio de marcar um item de rotina (ver
  /// [ItemRotina]) como concluído no dia, para saber o que já foi feito hoje.
  int? itemRotinaId;

  /// Foto do prato (só usada em registos de alimentação), guardada na pasta
  /// privada da app. Nunca sai do telemóvel nem entra no relatório PDF.
  String? fotoPath;

  @Index()
  late DateTime timestamp;
}
