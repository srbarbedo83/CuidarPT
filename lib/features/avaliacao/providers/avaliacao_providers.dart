import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/local/isar_providers.dart';
import '../../../data/repositories/estado_avaliacao_app_repository.dart';

final estadoAvaliacaoAppRepositoryProvider = Provider<EstadoAvaliacaoAppRepository>((ref) {
  return EstadoAvaliacaoAppRepository(ref.watch(isarInstanceProvider));
});
