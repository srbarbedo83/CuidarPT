import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/local/isar_providers.dart';
import '../../../data/models/registo_medicacao.dart';
import '../../../data/repositories/registo_medicacao_repository.dart';

final registoMedicacaoRepositoryProvider = Provider<RegistoMedicacaoRepository>((ref) {
  return RegistoMedicacaoRepository(ref.watch(isarInstanceProvider));
});

final medicacaoListProvider = StreamProvider.family<List<RegistoMedicacao>, int>((ref, idosoId) {
  return ref.watch(registoMedicacaoRepositoryProvider).watchByIdoso(idosoId);
});
