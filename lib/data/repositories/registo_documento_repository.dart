import 'package:isar_community/isar.dart';

import '../models/registo_documento.dart';

class RegistoDocumentoRepository {
  RegistoDocumentoRepository(this._isar);

  final Isar _isar;

  Stream<List<RegistoDocumento>> watchByIdoso(int idosoId) {
    return _isar.registoDocumentos
        .filter()
        .idosoIdEqualTo(idosoId)
        .sortByCriadoEmDesc()
        .watch(fireImmediately: true);
  }

  Future<int> save(RegistoDocumento registo) {
    return _isar.writeTxn(() => _isar.registoDocumentos.put(registo));
  }

  Future<void> delete(int id) {
    return _isar.writeTxn(() => _isar.registoDocumentos.delete(id));
  }
}
