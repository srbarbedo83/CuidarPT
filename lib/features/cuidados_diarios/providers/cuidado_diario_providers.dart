import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/local/isar_providers.dart';
import '../../../data/models/registo_cuidado_diario.dart';
import '../../../data/repositories/registo_cuidado_diario_repository.dart';

final registoCuidadoDiarioRepositoryProvider = Provider<RegistoCuidadoDiarioRepository>((ref) {
  return RegistoCuidadoDiarioRepository(ref.watch(isarInstanceProvider));
});

final cuidadoDiarioListProvider = StreamProvider.family<List<RegistoCuidadoDiario>, int>((ref, idosoId) {
  return ref.watch(registoCuidadoDiarioRepositoryProvider).watchByIdoso(idosoId);
});
