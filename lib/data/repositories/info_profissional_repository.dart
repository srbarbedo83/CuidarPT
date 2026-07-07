import 'package:isar_community/isar.dart';

import '../models/info_profissional.dart';

class InfoProfissionalRepository {
  InfoProfissionalRepository(this._isar);

  final Isar _isar;

  Stream<List<InfoProfissional>> watchByIdoso(int idosoId) {
    return _isar.infoProfissionals.filter().idosoIdEqualTo(idosoId).watch(fireImmediately: true);
  }

  Future<InfoProfissional?> buscarPorNome(int idosoId, String nome) {
    return _isar.infoProfissionals.filter().idosoIdEqualTo(idosoId).nomeEqualTo(nome).findFirst();
  }

  Future<int> save(InfoProfissional info) {
    return _isar.writeTxn(() => _isar.infoProfissionals.put(info));
  }
}
