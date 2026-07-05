import 'package:isar/isar.dart';

import '../../core/utils/photo_storage.dart';
import '../models/idoso.dart';

class IdosoRepository {
  IdosoRepository(this._isar);

  final Isar _isar;

  Stream<List<Idoso>> watchAll() {
    return _isar.idosos.where().sortByNome().watch(fireImmediately: true);
  }

  Future<Idoso?> getById(int id) => _isar.idosos.get(id);

  Future<int> save(Idoso idoso) {
    return _isar.writeTxn(() => _isar.idosos.put(idoso));
  }

  Future<void> delete(int id) async {
    final idoso = await getById(id);
    await _isar.writeTxn(() => _isar.idosos.delete(id));
    await PhotoStorage.apagarFoto(idoso?.fotoPath);
  }
}
