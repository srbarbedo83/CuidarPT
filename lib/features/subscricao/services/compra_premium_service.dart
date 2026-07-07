import 'dart:async';

import 'package:in_app_purchase/in_app_purchase.dart';

import '../../../data/repositories/subscricao_repository.dart';
import 'produtos_premium.dart';

/// Integração com a Google Play Billing para a subscrição Premium. Sem
/// servidor próprio: a confirmação da compra vem diretamente da Play
/// Store através do [InAppPurchase.purchaseStream].
class CompraPremiumService {
  CompraPremiumService(this._repository);

  final SubscricaoRepository _repository;
  final InAppPurchase _iap = InAppPurchase.instance;
  StreamSubscription<List<PurchaseDetails>>? _subscription;

  Future<bool> disponivel() => _iap.isAvailable();

  /// Começa a escutar atualizações de compras (novas compras, restauros).
  /// Deve ser chamado uma única vez, no arranque da app.
  void iniciarEscuta() {
    _subscription ??= _iap.purchaseStream.listen(_processarCompras);
  }

  void pararEscuta() {
    _subscription?.cancel();
    _subscription = null;
  }

  Future<void> _processarCompras(List<PurchaseDetails> compras) async {
    for (final compra in compras) {
      if (!ProdutosPremium.todos.contains(compra.productID)) continue;

      if (compra.status == PurchaseStatus.purchased || compra.status == PurchaseStatus.restored) {
        await _repository.ativarPremium(produtoId: compra.productID);
      }

      if (compra.pendingCompletePurchase) {
        await _iap.completePurchase(compra);
      }
    }
  }

  Future<ProductDetailsResponse> consultarProdutos() {
    return _iap.queryProductDetails(ProdutosPremium.todos);
  }

  Future<void> comprar(ProductDetails produto) {
    final param = PurchaseParam(productDetails: produto);
    return _iap.buyNonConsumable(purchaseParam: param);
  }

  Future<void> restaurarCompras() => _iap.restorePurchases();
}
