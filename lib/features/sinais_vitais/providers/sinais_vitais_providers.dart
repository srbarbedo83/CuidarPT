import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/local/isar_providers.dart';
import '../../../data/models/registo_sinais_vitais.dart';
import '../../../data/repositories/registo_sinais_vitais_repository.dart';

final registoSinaisVitaisRepositoryProvider = Provider<RegistoSinaisVitaisRepository>((ref) {
  return RegistoSinaisVitaisRepository(ref.watch(isarInstanceProvider));
});

final sinaisVitaisListProvider = StreamProvider.family<List<RegistoSinaisVitais>, int>((ref, idosoId) {
  return ref.watch(registoSinaisVitaisRepositoryProvider).watchByIdoso(idosoId);
});
