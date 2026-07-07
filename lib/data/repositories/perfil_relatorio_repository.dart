import 'package:isar_community/isar.dart';

import '../../core/utils/photo_storage.dart';
import '../models/perfil_relatorio.dart';

class PerfilRelatorioRepository {
  PerfilRelatorioRepository(this._isar);

  final Isar _isar;

  static const _idUnico = 0;

  Stream<PerfilRelatorio> watch() {
    return _isar.perfilRelatorios
        .watchObject(_idUnico, fireImmediately: true)
        .map((perfil) => perfil ?? PerfilRelatorio());
  }

  Future<PerfilRelatorio> obterAtual() async {
    return await _isar.perfilRelatorios.get(_idUnico) ?? PerfilRelatorio();
  }

  Future<void> guardar({String? cuidadorNome, String? logoPath}) {
    return _isar.writeTxn(() async {
      final perfil = await _isar.perfilRelatorios.get(_idUnico) ?? PerfilRelatorio();
      perfil
        ..cuidadorNome = cuidadorNome
        ..logoPath = logoPath;
      await _isar.perfilRelatorios.put(perfil);
    });
  }

  Future<void> guardarEmail(String? cuidadorEmail) {
    return _isar.writeTxn(() async {
      final perfil = await _isar.perfilRelatorios.get(_idUnico) ?? PerfilRelatorio();
      perfil.cuidadorEmail = cuidadorEmail;
      await _isar.perfilRelatorios.put(perfil);
    });
  }

  Future<void> apagarLogo() async {
    final perfil = await obterAtual();
    await PhotoStorage.apagarFoto(perfil.logoPath);
    await guardar(cuidadorNome: perfil.cuidadorNome, logoPath: null);
  }
}
