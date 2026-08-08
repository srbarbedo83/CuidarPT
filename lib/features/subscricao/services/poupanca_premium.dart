import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:intl/intl.dart';

import '../../../l10n/app_localizations.dart';
import 'produtos_premium.dart';

/// Ordem de apresentação dos planos Premium: mensal primeiro (a âncora de
/// preço), depois semestral e anual.
int ordemProdutoPremium(String id) => switch (id) {
      ProdutosPremium.mensal => 0,
      ProdutosPremium.semestral => 1,
      ProdutosPremium.anual => 2,
      _ => 3,
    };

int? mesesDoProdutoPremium(String id) => switch (id) {
      ProdutosPremium.semestral => 6,
      ProdutosPremium.anual => 12,
      _ => null,
    };

/// Compara o custo mensal equivalente de [produto] com o plano mensal (a
/// âncora de preço), para mostrar a poupança real do plano semestral/anual
/// em vez de todos os planos aparecerem com o mesmo peso visual. Só
/// devolve algo quando há mesmo poupança nos preços devolvidos pela loja —
/// nunca inventada.
String? poupancaLabelPremium(AppLocalizations l10n, ProductDetails produto, ProductDetails? mensal) {
  final meses = mesesDoProdutoPremium(produto.id);
  if (meses == null || mensal == null || mensal.rawPrice <= 0) return null;

  final custoMensalEquivalente = produto.rawPrice / meses;
  final poupanca = 1 - (custoMensalEquivalente / mensal.rawPrice);
  if (poupanca <= 0) return null;

  final localeFormato = switch (l10n.localeName) {
    'en' => 'en_US',
    'es' => 'es_ES',
    _ => 'pt_PT',
  };
  final formato = NumberFormat.simpleCurrency(locale: localeFormato, name: produto.currencyCode);
  return l10n.premiumPoupancaLabel((poupanca * 100).round(), formato.format(custoMensalEquivalente));
}
