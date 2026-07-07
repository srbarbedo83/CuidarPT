import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/local/isar_providers.dart';
import '../../../data/models/item_rotina.dart';
import '../../../data/repositories/item_rotina_repository.dart';

final itemRotinaRepositoryProvider = Provider<ItemRotinaRepository>((ref) {
  return ItemRotinaRepository(ref.watch(isarInstanceProvider));
});

final itemRotinaListProvider = StreamProvider.family<List<ItemRotina>, int>((ref, idosoId) {
  return ref.watch(itemRotinaRepositoryProvider).watchByIdoso(idosoId);
});
