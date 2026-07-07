import 'package:isar_community/isar.dart';

import '../models/estado_subscricao.dart';

class SubscricaoRepository {
  SubscricaoRepository(this._isar);

  final Isar _isar;

  static const _idUnico = 0;

  static const duracaoTrial = Duration(days: 7);

  Stream<EstadoSubscricao?> watch() {
    return _isar.estadoSubscricaos.watchObject(_idUnico, fireImmediately: true);
  }

  Future<EstadoSubscricao?> obterAtual() {
    return _isar.estadoSubscricaos.get(_idUnico);
  }

  /// Inicia o trial de 7 dias de Premium, de forma automática e
  /// incondicional. Não faz nada se o onboarding já tiver sido concluído
  /// antes (não reinicia o trial).
  Future<void> iniciarTrialSeNecessario() async {
    final existente = await obterAtual();
    if (existente != null) return;

    final agora = DateTime.now();
    final estado = EstadoSubscricao()
      ..trialInicio = agora
      ..trialFim = agora.add(duracaoTrial)
      ..plano = Plano.free;

    await _isar.writeTxn(() async {
      await _isar.estadoSubscricaos.put(estado);
    });
  }

  /// Marca o plano como Premium a partir de uma compra confirmada pela
  /// Google Play (ver [CompraPremiumService]). Sem servidor próprio para
  /// validar recibos, confia-se no estado que a Play Store devolve através
  /// do purchaseStream/restorePurchases.
  Future<void> ativarPremium({required String produtoId}) async {
    final agora = DateTime.now();
    final atual = await obterAtual() ??
        (EstadoSubscricao()
          ..trialInicio = agora
          ..trialFim = agora);
    atual
      ..plano = Plano.premium
      ..produtoPlayStoreId = produtoId
      ..ultimaValidacaoCompra = agora;

    await _isar.writeTxn(() async {
      await _isar.estadoSubscricaos.put(atual);
    });
  }
}
