import 'package:isar/isar.dart';

import '../models/registo_medicacao.dart';

class RegistoMedicacaoRepository {
  RegistoMedicacaoRepository(this._isar);

  final Isar _isar;

  Stream<List<RegistoMedicacao>> watchByIdoso(int idosoId) {
    return _isar.registoMedicacaos
        .filter()
        .idosoIdEqualTo(idosoId)
        .sortByNomeMedicamento()
        .watch(fireImmediately: true);
  }

  Future<RegistoMedicacao?> getById(int id) => _isar.registoMedicacaos.get(id);

  /// Todos os registos ativos, de todos os idosos — usado para reagendar
  /// os lembretes quando a app arranca.
  Future<List<RegistoMedicacao>> listarAtivos() {
    return _isar.registoMedicacaos.filter().ativoEqualTo(true).findAll();
  }

  /// Medicação atual (ativa) de um idoso — usada no relatório PDF como
  /// referência, independentemente do período escolhido.
  Future<List<RegistoMedicacao>> listarAtivosPorIdoso(int idosoId) {
    return _isar.registoMedicacaos
        .filter()
        .idosoIdEqualTo(idosoId)
        .ativoEqualTo(true)
        .sortByNomeMedicamento()
        .findAll();
  }

  Future<int> save(RegistoMedicacao registo) {
    return _isar.writeTxn(() => _isar.registoMedicacaos.put(registo));
  }

  Future<void> delete(int id) {
    return _isar.writeTxn(() => _isar.registoMedicacaos.delete(id));
  }
}
