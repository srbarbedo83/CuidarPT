import '../../../l10n/app_localizations.dart';

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
String labelProdutoPremium(AppLocalizations l10n, String produtoId) {
  return switch (produtoId) {
    ProdutosPremium.mensal => l10n.premiumPlanoMensal,
    ProdutosPremium.semestral => l10n.premiumPlano6Meses,
    ProdutosPremium.anual => l10n.premiumPlanoAnual,
    _ => produtoId,
  };
}
