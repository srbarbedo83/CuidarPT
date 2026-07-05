import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/local/isar_providers.dart';
import '../../../data/models/perfil_relatorio.dart';
import '../../../data/repositories/perfil_relatorio_repository.dart';

final perfilRelatorioRepositoryProvider = Provider<PerfilRelatorioRepository>((ref) {
  return PerfilRelatorioRepository(ref.watch(isarInstanceProvider));
});

final perfilRelatorioProvider = StreamProvider<PerfilRelatorio>((ref) {
  return ref.watch(perfilRelatorioRepositoryProvider).watch();
});
