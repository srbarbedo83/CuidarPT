import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/estado_subscricao.dart';

/// Abre a instância única do Isar, guardada na pasta privada de documentos
/// da app. Nenhum dado sai do dispositivo.
class IsarService {
  IsarService._();

  static Future<Isar> open() async {
    final documentosDir = await getApplicationDocumentsDirectory();
    return Isar.open(
      [EstadoSubscricaoSchema],
      directory: documentosDir.path,
    );
  }
}
