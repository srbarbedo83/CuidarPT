import 'package:cuidarpt/features/subscricao/services/produtos_premium.dart';
import 'package:flutter_test/flutter_test.dart';

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
      expect(labelProdutoPremium(ProdutosPremium.mensal), 'Mensal');
      expect(labelProdutoPremium(ProdutosPremium.semestral), '6 meses');
      expect(labelProdutoPremium(ProdutosPremium.anual), 'Anual');
    });

    test('devolve o próprio ID para um produto desconhecido', () {
      expect(labelProdutoPremium('outro_produto'), 'outro_produto');
    });
  });
}
