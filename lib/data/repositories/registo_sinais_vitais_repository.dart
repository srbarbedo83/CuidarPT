import 'package:isar_community/isar.dart';

import '../models/registo_sinais_vitais.dart';

class RegistoSinaisVitaisRepository {
  RegistoSinaisVitaisRepository(this._isar);

  final Isar _isar;

  Stream<List<RegistoSinaisVitais>> watchByIdoso(int idosoId) {
    return _isar.registoSinaisVitais
        .filter()
        .idosoIdEqualTo(idosoId)
        .sortByTimestampDesc()
        .watch(fireImmediately: true);
  }

  Future<int> save(RegistoSinaisVitais registo) {
    return _isar.writeTxn(() => _isar.registoSinaisVitais.put(registo));
  }

  Future<void> delete(int id) {
    return _isar.writeTxn(() => _isar.registoSinaisVitais.delete(id));
  }
}
