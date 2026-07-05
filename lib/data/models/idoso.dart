import 'package:isar/isar.dart';

part 'idoso.g.dart';

@collection
class Idoso {
  Id id = Isar.autoIncrement;

  late String nome;

  DateTime? dataNascimento;

  /// Caminho absoluto do ficheiro de foto dentro da pasta de documentos da
  /// app (ver [PhotoStorage]). Nunca é enviado para fora do dispositivo.
  String? fotoPath;

  String? contactoEmergenciaNome;
  String? contactoEmergenciaTelefone;

  /// Alergias, condições de saúde ou outras notas relevantes.
  String? notas;

  late DateTime criadoEm;

  late DateTime atualizadoEm;
}
