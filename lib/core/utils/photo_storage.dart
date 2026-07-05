import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

/// Guarda imagens (fotos de idosos, logótipos de relatórios) dentro da
/// pasta privada de documentos da app (getApplicationDocumentsDirectory),
/// nunca fora do dispositivo.
class PhotoStorage {
  PhotoStorage._();

  static const _uuid = Uuid();

  static Future<Directory> _pastaDir(String nome) async {
    final documentosDir = await getApplicationDocumentsDirectory();
    final pasta = Directory(p.join(documentosDir.path, nome));
    if (!await pasta.exists()) {
      await pasta.create(recursive: true);
    }
    return pasta;
  }

  /// Copia [origem] para uma subpasta privada da app com um nome único e
  /// devolve o caminho absoluto do ficheiro guardado.
  static Future<String> _guardar(File origem, {required String pasta}) async {
    final pastaDir = await _pastaDir(pasta);
    final extensao = p.extension(origem.path);
    final destino = p.join(pastaDir.path, '${_uuid.v4()}$extensao');
    final ficheiroGuardado = await origem.copy(destino);
    return ficheiroGuardado.path;
  }

  static Future<String> guardarFotoIdoso(File origem) {
    return _guardar(origem, pasta: 'fotos_idosos');
  }

  static Future<String> guardarLogoRelatorio(File origem) {
    return _guardar(origem, pasta: 'logos_relatorio');
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
