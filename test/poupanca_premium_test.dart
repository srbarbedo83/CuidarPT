import 'package:cuidarpt/features/subscricao/services/poupanca_premium.dart';
import 'package:cuidarpt/features/subscricao/services/produtos_premium.dart';
import 'package:cuidarpt/l10n/app_localizations_pt.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

final _l10n = AppLocalizationsPt();

ProductDetails _produto(String id, double rawPrice, {String currencyCode = 'EUR'}) {
  return ProductDetails(
    id: id,
    title: id,
    description: 'Descrição de $id',
    price: '$rawPrice €',
    rawPrice: rawPrice,
    currencyCode: currencyCode,
  );
}

void main() {
  group('ordemProdutoPremium', () {
    test('mensal < semestral < anual < desconhecido', () {
      expect(ordemProdutoPremium(ProdutosPremium.mensal), lessThan(ordemProdutoPremium(ProdutosPremium.semestral)));
      expect(ordemProdutoPremium(ProdutosPremium.semestral), lessThan(ordemProdutoPremium(ProdutosPremium.anual)));
      expect(ordemProdutoPremium(ProdutosPremium.anual), lessThan(ordemProdutoPremium('outro')));
    });
  });

  group('mesesDoProdutoPremium', () {
    test('semestral são 6 meses e anual são 12', () {
      expect(mesesDoProdutoPremium(ProdutosPremium.semestral), 6);
      expect(mesesDoProdutoPremium(ProdutosPremium.anual), 12);
    });

    test('mensal e desconhecido devolvem null (não têm equivalente a calcular)', () {
      expect(mesesDoProdutoPremium(ProdutosPremium.mensal), isNull);
      expect(mesesDoProdutoPremium('outro'), isNull);
    });
  });

  group('poupancaLabelPremium', () {
    test('null quando não há preço mensal para comparar', () {
      final anual = _produto(ProdutosPremium.anual, 19.99);
      expect(poupancaLabelPremium(_l10n, anual, null), isNull);
    });

    test('null para o próprio plano mensal (não compara consigo mesmo)', () {
      final mensal = _produto(ProdutosPremium.mensal, 1.99);
      expect(poupancaLabelPremium(_l10n, mensal, mensal), isNull);
    });

    test('calcula a poupança real do plano anual face ao mensal', () {
      final mensal = _produto(ProdutosPremium.mensal, 1.99);
      final anual = _produto(ProdutosPremium.anual, 19.99);

      final label = poupancaLabelPremium(_l10n, anual, mensal);

      expect(label, contains('Poupas 16%'));
      expect(label, contains('1,67'));
    });

    test('null quando o plano mais longo não é mais barato por mês', () {
      final mensal = _produto(ProdutosPremium.mensal, 1.99);
      final anual = _produto(ProdutosPremium.anual, 30);

      expect(poupancaLabelPremium(_l10n, anual, mensal), isNull);
    });
  });
}
