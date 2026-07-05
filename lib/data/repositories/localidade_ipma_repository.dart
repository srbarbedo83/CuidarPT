import 'package:isar/isar.dart';

import '../models/localidade_ipma.dart';

class LocalidadeIpmaRepository {
  LocalidadeIpmaRepository(this._isar);

  final Isar _isar;

  Future<List<LocalidadeIpma>> listarTodas() {
    return _isar.localidadeIpmas.where().sortByNome().findAll();
  }

  Future<void> substituirTodas(List<LocalidadeIpma> localidades) {
    return _isar.writeTxn(() async {
      await _isar.localidadeIpmas.clear();
      await _isar.localidadeIpmas.putAll(localidades);
    });
  }
}
