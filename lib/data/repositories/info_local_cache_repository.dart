import 'package:isar/isar.dart';

import '../models/info_local_cache.dart';

class InfoLocalCacheRepository {
  InfoLocalCacheRepository(this._isar);

  final Isar _isar;

  static const _idUnico = 0;

  Future<InfoLocalCache?> obter() => _isar.infoLocalCaches.get(_idUnico);

  Future<void> guardar({String? previsaoJson, String? avisosJson}) {
    return _isar.writeTxn(() async {
      final atual = await _isar.infoLocalCaches.get(_idUnico) ?? InfoLocalCache();
      atual
        ..previsaoJson = previsaoJson ?? atual.previsaoJson
        ..avisosJson = avisosJson ?? atual.avisosJson
        ..atualizadoEm = DateTime.now();
      await _isar.infoLocalCaches.put(atual);
    });
  }
}
