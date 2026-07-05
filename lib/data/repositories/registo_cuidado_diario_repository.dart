import 'package:isar/isar.dart';

import '../models/registo_cuidado_diario.dart';

class RegistoCuidadoDiarioRepository {
  RegistoCuidadoDiarioRepository(this._isar);

  final Isar _isar;

  Stream<List<RegistoCuidadoDiario>> watchByIdoso(int idosoId) {
    return _isar.registoCuidadoDiarios
        .filter()
        .idosoIdEqualTo(idosoId)
        .sortByTimestampDesc()
        .watch(fireImmediately: true);
  }

  /// Cuidados diários de um idoso com timestamp dentro de [inicio, fim] —
  /// usado no relatório PDF.
  Future<List<RegistoCuidadoDiario>> listarPorIdosoEPeriodo(
    int idosoId, {
    required DateTime inicio,
    required DateTime fim,
  }) {
    return _isar.registoCuidadoDiarios
        .filter()
        .idosoIdEqualTo(idosoId)
        .timestampBetween(inicio, fim)
        .sortByTimestamp()
        .findAll();
  }

  Future<int> save(RegistoCuidadoDiario registo) {
    return _isar.writeTxn(() => _isar.registoCuidadoDiarios.put(registo));
  }

  Future<void> delete(int id) {
    return _isar.writeTxn(() => _isar.registoCuidadoDiarios.delete(id));
  }
}
