import 'package:isar_community/isar.dart';

import '../models/preferencias_app.dart';

class PreferenciasRepository {
  PreferenciasRepository(this._isar);

  final Isar _isar;

  static const _idUnico = 0;

  Stream<PreferenciasApp?> watch() {
    return _isar.preferenciasApps.watchObject(_idUnico, fireImmediately: true);
  }

  Future<PreferenciasApp?> obterAtual() {
    return _isar.preferenciasApps.get(_idUnico);
  }

  Future<void> definirTema(TemaPreferido tema) async {
    final atual = await obterAtual() ?? PreferenciasApp();
    atual.tema = tema;
    await _isar.writeTxn(() async {
      await _isar.preferenciasApps.put(atual);
    });
  }

  Future<void> definirEscalaTexto(double escala) async {
    final atual = await obterAtual() ?? PreferenciasApp();
    atual.escalaTexto = escala;
    await _isar.writeTxn(() async {
      await _isar.preferenciasApps.put(atual);
    });
  }
}
