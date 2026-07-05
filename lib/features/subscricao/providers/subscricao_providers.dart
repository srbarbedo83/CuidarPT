import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/local/isar_providers.dart';
import '../../../data/models/estado_subscricao.dart';
import '../../../data/repositories/subscricao_repository.dart';

final subscricaoRepositoryProvider = Provider<SubscricaoRepository>((ref) {
  return SubscricaoRepository(ref.watch(isarInstanceProvider));
});

/// `null` enquanto o onboarding ainda não foi concluído (nenhum trial
/// iniciado ainda).
final estadoSubscricaoProvider = StreamProvider<EstadoSubscricao?>((ref) {
  return ref.watch(subscricaoRepositoryProvider).watch();
});

/// `true` durante o trial de 7 dias ou com Premium ativo. Antes do
/// onboarding estar concluído, considera-se `false`.
final isPremiumProvider = Provider<bool>((ref) {
  return ref.watch(estadoSubscricaoProvider).value?.isPremium ?? false;
});
