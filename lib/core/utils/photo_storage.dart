import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

/// Guarda fotos de idosos dentro da pasta privada de documentos da app
/// (getApplicationDocumentsDirectory), nunca fora do dispositivo.
class PhotoStorage {
  PhotoStorage._();

  static const _uuid = Uuid();
  static const _pastaFotos = 'fotos_idosos';

  static Future<Directory> _pastaFotosDir() async {
    final documentosDir = await getApplicationDocumentsDirectory();
    final pastaFotos = Directory(p.join(documentosDir.path, _pastaFotos));
    if (!await pastaFotos.exists()) {
      await pastaFotos.create(recursive: true);
    }
    return pastaFotos;
  }

  /// Copia [origem] para a pasta privada da app com um nome único e
  /// devolve o caminho absoluto do ficheiro guardado.
  static Future<String> guardarFotoIdoso(File origem) async {
    final pastaFotos = await _pastaFotosDir();
    final extensao = p.extension(origem.path);
    final destino = p.join(pastaFotos.path, '${_uuid.v4()}$extensao');
    final ficheiroGuardado = await origem.copy(destino);
    return ficheiroGuardado.path;
  }

  /// Apaga uma foto previamente guardada, se ainda existir.
  static Future<void> apagarFoto(String? caminho) async {
    if (caminho == null) return;
    final ficheiro = File(caminho);
    if (await ficheiro.exists()) {
      await ficheiro.delete();
    }
  }
}
