import 'package:isar_community/isar.dart';

import 'contacto_emergencia.dart';

part 'idoso.g.dart';

@collection
class Idoso {
  Id id = Isar.autoIncrement;

  late String nome;

  DateTime? dataNascimento;

  /// Caminho absoluto do ficheiro de foto dentro da pasta de documentos da
  /// app (ver [PhotoStorage]). Nunca é enviado para fora do dispositivo.
  String? fotoPath;

  /// Contactos de emergência (família/cuidadores), por ordem de prioridade.
  List<ContactoEmergencia> contactosEmergencia = [];

  /// Alergias, condições de saúde ou outras notas relevantes.
  String? notas;

  /// Indica mobilidade reduzida (mostra um ícone de cadeira de rodas junto à foto).
  bool mobilidadeReduzida = false;

  late DateTime criadoEm;

  late DateTime atualizadoEm;
}
