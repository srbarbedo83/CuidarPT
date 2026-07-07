import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../../data/local/isar_providers.dart';
import '../../../data/models/estado_subscricao.dart';
import '../../../data/repositories/subscricao_repository.dart';
import '../services/compra_premium_service.dart';

final subscricaoRepositoryProvider = Provider<SubscricaoRepository>((ref) {
  return SubscricaoRepository(ref.watch(isarInstanceProvider));
});

final compraPremiumServiceProvider = Provider<CompraPremiumService>((ref) {
  return CompraPremiumService(ref.watch(subscricaoRepositoryProvider));
});

/// Produtos Premium disponíveis na Play Store, com preço já localizado.
final produtosPremiumProvider = FutureProvider<List<ProductDetails>>((ref) async {
  final resposta = await ref.watch(compraPremiumServiceProvider).consultarProdutos();
  return resposta.productDetails;
});

/// `null` enquanto o onboarding ainda não foi concluído (nenhum trial
/// iniciado ainda).
final estadoSubscricaoProvider = StreamProvider<EstadoSubscricao?>((ref) {
  return ref.watch(subscricaoRepositoryProvider).watch();
});

/// `true` durante o trial de 7 dias ou com Premium ativo. Antes do
/// onboarding estar concluído, considera-se `false`.
final isPremiumProvider = Provider<bool>((ref) {
  return ref.watch(estadoSubscricaoProvider).valueOrNull?.isPremium ?? false;
});
