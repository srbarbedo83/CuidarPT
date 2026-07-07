import 'package:isar_community/isar.dart';

import 'contacto_emergencia.dart';
import 'preferencias_idoso.dart';

part 'idoso.g.dart';

enum Sexo { masculino, feminino }

@collection
class Idoso {
  Id id = Isar.autoIncrement;

  late String nome;

  @Enumerated(EnumType.name)
  Sexo? sexo;

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

  /// Indica que o idoso está acamado (mostra um ícone de cama junto à foto).
  bool acamado = false;

  PreferenciasIdoso? preferencias;

  /// Ativa a secção de rotina de higiene/alimentação (Premium), desligada
  /// por predefinição.
  bool rotinasAtivas = false;

  late DateTime criadoEm;

  late DateTime atualizadoEm;
}
