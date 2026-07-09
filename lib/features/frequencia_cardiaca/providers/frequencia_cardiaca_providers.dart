import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/local/isar_providers.dart';
import '../../../data/models/registo_frequencia_cardiaca.dart';
import '../../../data/repositories/registo_frequencia_cardiaca_repository.dart';

final registoFrequenciaCardiacaRepositoryProvider = Provider<RegistoFrequenciaCardiacaRepository>((ref) {
  return RegistoFrequenciaCardiacaRepository(ref.watch(isarInstanceProvider));
});

final frequenciaCardiacaListProvider =
    StreamProvider.family<List<RegistoFrequenciaCardiaca>, int>((ref, idosoId) {
  return ref.watch(registoFrequenciaCardiacaRepositoryProvider).watchByIdoso(idosoId);
});
