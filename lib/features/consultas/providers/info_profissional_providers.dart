import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/local/isar_providers.dart';
import '../../../data/models/info_profissional.dart';
import '../../../data/repositories/info_profissional_repository.dart';

final infoProfissionalRepositoryProvider = Provider<InfoProfissionalRepository>((ref) {
  return InfoProfissionalRepository(ref.watch(isarInstanceProvider));
});

final infoProfissionalListProvider = StreamProvider.family<List<InfoProfissional>, int>((ref, idosoId) {
  return ref.watch(infoProfissionalRepositoryProvider).watchByIdoso(idosoId);
});
