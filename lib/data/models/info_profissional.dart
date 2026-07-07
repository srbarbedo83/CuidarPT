import 'package:isar_community/isar.dart';

part 'info_profissional.g.dart';

/// Informação editável de um profissional (médico/enfermeiro) que vai
/// surgindo automaticamente à medida que se preenche o nome numa consulta
/// ou tratamento. O nome continua a ser derivado das consultas — isto
/// guarda só o contacto e as notas que o cuidador queira acrescentar.
@collection
class InfoProfissional {
  Id id = Isar.autoIncrement;

  @Index()
  late int idosoId;

  @Index()
  late String nome;

  String? contacto;
  String? notas;
}
