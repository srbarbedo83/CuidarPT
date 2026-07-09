import 'package:isar_community/isar.dart';

import '../models/registo_frequencia_cardiaca.dart';

class RegistoFrequenciaCardiacaRepository {
  RegistoFrequenciaCardiacaRepository(this._isar);

  final Isar _isar;

  Stream<List<RegistoFrequenciaCardiaca>> watchByIdoso(int idosoId) {
    return _isar.registoFrequenciaCardiacas
        .filter()
        .idosoIdEqualTo(idosoId)
        .sortByTimestampDesc()
        .watch(fireImmediately: true);
  }

  Future<List<RegistoFrequenciaCardiaca>> listarPorIdosoEPeriodo(
    int idosoId, {
    required DateTime inicio,
    required DateTime fim,
  }) {
    return _isar.registoFrequenciaCardiacas
        .filter()
        .idosoIdEqualTo(idosoId)
        .timestampBetween(inicio, fim)
        .sortByTimestamp()
        .findAll();
  }

  Future<int> save(RegistoFrequenciaCardiaca registo) {
    return _isar.writeTxn(() => _isar.registoFrequenciaCardiacas.put(registo));
  }

  Future<void> delete(int id) {
    return _isar.writeTxn(() => _isar.registoFrequenciaCardiacas.delete(id));
  }
}
