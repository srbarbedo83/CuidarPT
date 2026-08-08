import 'package:cuidarpt/features/subscricao/services/produtos_premium.dart';
import 'package:cuidarpt/l10n/app_localizations_pt.dart';
import 'package:flutter_test/flutter_test.dart';

final _l10n = AppLocalizationsPt();

void main() {
  group('ProdutosPremium', () {
    test('todos contém os 3 planos, sem duplicados', () {
      expect(ProdutosPremium.todos, {
        ProdutosPremium.mensal,
        ProdutosPremium.semestral,
        ProdutosPremium.anual,
      });
      expect(ProdutosPremium.todos, hasLength(3));
    });
  });

  group('labelProdutoPremium', () {
    test('devolve o rótulo certo para cada produto', () {
      expect(labelProdutoPremium(_l10n, ProdutosPremium.mensal), 'Mensal');
      expect(labelProdutoPremium(_l10n, ProdutosPremium.semestral), '6 meses');
      expect(labelProdutoPremium(_l10n, ProdutosPremium.anual), 'Anual');
    });

    test('devolve o próprio ID para um produto desconhecido', () {
      expect(labelProdutoPremium(_l10n, 'outro_produto'), 'outro_produto');
    });
  });
}
