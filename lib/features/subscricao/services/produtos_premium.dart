/// IDs dos produtos de subscrição Premium — têm de corresponder
/// exatamente aos produtos criados na Play Console (Monetização >
/// Produtos > Subscrições).
class ProdutosPremium {
  ProdutosPremium._();

  static const mensal = 'cuidarpt_premium_mensal';
  static const semestral = 'cuidarpt_premium_semestral';
  static const anual = 'cuidarpt_premium_anual';

  static const todos = {mensal, semestral, anual};
}

/// Rótulo curto do plano a partir do ID do produto, para apresentação na
/// interface (ex.: quando o preço da loja ainda não carregou).
String labelProdutoPremium(String produtoId) {
  return switch (produtoId) {
    ProdutosPremium.mensal => 'Mensal',
    ProdutosPremium.semestral => '6 meses',
    ProdutosPremium.anual => 'Anual',
    _ => produtoId,
  };
}
