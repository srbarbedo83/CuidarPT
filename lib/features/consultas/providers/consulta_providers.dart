import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/local/isar_providers.dart';
import '../../../data/models/registo_consulta.dart';
import '../../../data/repositories/registo_consulta_repository.dart';

final registoConsultaRepositoryProvider = Provider<RegistoConsultaRepository>((ref) {
  return RegistoConsultaRepository(ref.watch(isarInstanceProvider));
});

final consultaListProvider = StreamProvider.family<List<RegistoConsulta>, int>((ref, idosoId) {
  return ref.watch(registoConsultaRepositoryProvider).watchByIdoso(idosoId);
});
