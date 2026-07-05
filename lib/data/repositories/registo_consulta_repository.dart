import 'package:isar/isar.dart';

import '../models/registo_consulta.dart';

class RegistoConsultaRepository {
  RegistoConsultaRepository(this._isar);

  final Isar _isar;

  Stream<List<RegistoConsulta>> watchByIdoso(int idosoId) {
    return _isar.registoConsultas
        .filter()
        .idosoIdEqualTo(idosoId)
        .sortByDataHoraDesc()
        .watch(fireImmediately: true);
  }

  Future<RegistoConsulta?> getById(int id) => _isar.registoConsultas.get(id);

  /// Todos os registos com lembretes ativos — usado para reagendar os
  /// lembretes quando a app arranca.
  Future<List<RegistoConsulta>> listarComLembreteAtivo() {
    return _isar.registoConsultas.filter().lembreteAtivoEqualTo(true).findAll();
  }

  /// Consultas de um idoso com data dentro de [inicio, fim] — usado no
  /// relatório PDF.
  Future<List<RegistoConsulta>> listarPorIdosoEPeriodo(
    int idosoId, {
    required DateTime inicio,
    required DateTime fim,
  }) {
    return _isar.registoConsultas
        .filter()
        .idosoIdEqualTo(idosoId)
        .dataHoraBetween(inicio, fim)
        .sortByDataHora()
        .findAll();
  }

  Future<int> save(RegistoConsulta consulta) {
    return _isar.writeTxn(() => _isar.registoConsultas.put(consulta));
  }

  Future<void> delete(int id) {
    return _isar.writeTxn(() => _isar.registoConsultas.delete(id));
  }
}
