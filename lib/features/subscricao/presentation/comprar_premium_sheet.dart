import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../../l10n/app_localizations.dart';
import '../providers/subscricao_providers.dart';
import '../services/produtos_premium.dart';
import '../services/poupanca_premium.dart';

Future<void> mostrarCompraPremium(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (context) => const _ComprarPremiumSheet(),
  );
}

class _ComprarPremiumSheet extends ConsumerWidget {
  const _ComprarPremiumSheet();

  Future<void> _comprar(BuildContext context, WidgetRef ref, ProductDetails produto) async {
    Navigator.of(context).pop();
    await ref.read(compraPremiumServiceProvider).comprar(produto);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final produtosAsync = ref.watch(produtosPremiumProvider);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(24, 24, 24, 24 + MediaQuery.of(context).padding.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.premiumSubscreverTitulo,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            produtosAsync.when(
              data: (produtos) {
                if (produtos.isEmpty) {
                  return Text(l10n.premiumErroCarregarPlanos);
                }
                final produtosOrdenados = [...produtos]
                  ..sort((a, b) => ordemProdutoPremium(a.id).compareTo(ordemProdutoPremium(b.id)));
                final mensal = produtos.firstWhereOrNull((p) => p.id == ProdutosPremium.mensal);

                return Column(
                  children: [
                    for (final produto in produtosOrdenados)
                      Card(
                        color: produto.id == ProdutosPremium.anual
                            ? Theme.of(context).colorScheme.primaryContainer
                            : null,
                        child: ListTile(
                          title: Text(labelProdutoPremium(l10n, produto.id)),
                          subtitle: Text(poupancaLabelPremium(l10n, produto, mensal) ?? produto.description),
                          trailing: Text(
                            produto.price,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          onTap: () => _comprar(context, ref, produto),
                        ),
                      ),
                  ],
                );
              },
              loading: () => const Center(child: Padding(
                padding: EdgeInsets.all(24),
                child: CircularProgressIndicator(),
              )),
              error: (erro, _) => Text(l10n.premiumErroCarregar('$erro')),
            ),
            const SizedBox(height: 8),
            Center(
              child: TextButton(
                onPressed: () async {
                  await ref.read(compraPremiumServiceProvider).restaurarCompras();
                  if (context.mounted) Navigator.of(context).pop();
                },
                child: Text(l10n.premiumRestaurarCompra),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
