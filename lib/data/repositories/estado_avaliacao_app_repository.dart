import 'package:isar_community/isar.dart';

import '../models/estado_avaliacao_app.dart';

class EstadoAvaliacaoAppRepository {
  EstadoAvaliacaoAppRepository(this._isar);

  final Isar _isar;

  static const _idUnico = 0;

  Future<DateTime?> ultimaVezMostrado() async {
    final estado = await _isar.estadoAvaliacaoApps.get(_idUnico);
    return estado?.ultimaVezMostrado;
  }

  Future<void> marcarComoMostrado(DateTime quando) {
    return _isar.writeTxn(() async {
      final estado = await _isar.estadoAvaliacaoApps.get(_idUnico) ?? EstadoAvaliacaoApp();
      estado.ultimaVezMostrado = quando;
      await _isar.estadoAvaliacaoApps.put(estado);
    });
  }
}
