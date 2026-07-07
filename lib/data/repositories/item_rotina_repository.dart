import 'package:isar_community/isar.dart';

import '../models/item_rotina.dart';

class ItemRotinaRepository {
  ItemRotinaRepository(this._isar);

  final Isar _isar;

  Stream<List<ItemRotina>> watchByIdoso(int idosoId) {
    return _isar.itemRotinas
        .filter()
        .idosoIdEqualTo(idosoId)
        .sortByCriadoEm()
        .watch(fireImmediately: true);
  }

  Future<int> save(ItemRotina item) {
    return _isar.writeTxn(() => _isar.itemRotinas.put(item));
  }

  Future<void> delete(int id) {
    return _isar.writeTxn(() => _isar.itemRotinas.delete(id));
  }
}
