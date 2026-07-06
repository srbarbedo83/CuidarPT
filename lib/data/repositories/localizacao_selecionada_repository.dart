import 'package:isar_community/isar.dart';

import '../models/localidade_ipma.dart';
import '../models/localizacao_selecionada.dart';

class LocalizacaoSelecionadaRepository {
  LocalizacaoSelecionadaRepository(this._isar);

  final Isar _isar;

  static const _idUnico = 0;

  Stream<LocalizacaoSelecionada?> watch() {
    return _isar.localizacaoSelecionadas.watchObject(_idUnico, fireImmediately: true);
  }

  Future<void> selecionar(LocalidadeIpma localidade) {
    return _isar.writeTxn(() async {
      final atual = LocalizacaoSelecionada()
        ..globalIdLocal = localidade.globalIdLocal
        ..nome = localidade.nome
        ..idAreaAviso = localidade.idAreaAviso;
      await _isar.localizacaoSelecionadas.put(atual);
    });
  }
}
