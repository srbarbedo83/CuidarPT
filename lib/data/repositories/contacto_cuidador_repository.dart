import 'package:isar_community/isar.dart';

import '../models/contacto_cuidador.dart';

class ContactoCuidadorRepository {
  ContactoCuidadorRepository(this._isar);

  final Isar _isar;

  Stream<List<ContactoCuidador>> watchTodos() {
    return _isar.contactoCuidadors.where().sortByNome().watch(fireImmediately: true);
  }

  Future<int> save(ContactoCuidador contacto) {
    return _isar.writeTxn(() => _isar.contactoCuidadors.put(contacto));
  }

  Future<void> delete(int id) {
    return _isar.writeTxn(() => _isar.contactoCuidadors.delete(id));
  }
}
