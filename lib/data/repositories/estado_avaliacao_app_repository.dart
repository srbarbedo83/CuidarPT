import 'package:isar/isar.dart';

import '../models/estado_avaliacao_app.dart';

class EstadoAvaliacaoAppRepository {
  EstadoAvaliacaoAppRepository(this._isar);

  final Isar _isar;

  static const _idUnico = 0;

  Future<bool> jaMostrado() async {
    final estado = await _isar.estadoAvaliacaoApps.get(_idUnico);
    return estado?.jaMostrado ?? false;
  }

  Future<void> marcarComoMostrado() {
    return _isar.writeTxn(() async {
      final estado = await _isar.estadoAvaliacaoApps.get(_idUnico) ?? EstadoAvaliacaoApp();
      estado.jaMostrado = true;
      await _isar.estadoAvaliacaoApps.put(estado);
    });
  }
}
