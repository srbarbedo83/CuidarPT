import 'package:isar_community/isar.dart';

part 'registo_documento.g.dart';

/// Documento médico (receita, exame) de um idoso, guardado como imagem
/// dentro da pasta privada da app. Nunca sai do dispositivo.
@collection
class RegistoDocumento {
  Id id = Isar.autoIncrement;

  @Index()
  late int idosoId;

  late String titulo;

  /// Caminho absoluto do ficheiro dentro da pasta de documentos da app.
  late String caminhoFicheiro;

  late DateTime criadoEm;
}
