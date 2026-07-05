import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/local/isar_providers.dart';
import '../../../data/models/idoso.dart';
import '../../../data/repositories/idoso_repository.dart';

final idosoRepositoryProvider = Provider<IdosoRepository>((ref) {
  return IdosoRepository(ref.watch(isarInstanceProvider));
});

final idosoListProvider = StreamProvider<List<Idoso>>((ref) {
  return ref.watch(idosoRepositoryProvider).watchAll();
});
