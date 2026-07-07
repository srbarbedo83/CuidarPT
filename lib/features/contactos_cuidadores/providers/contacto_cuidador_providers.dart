import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/local/isar_providers.dart';
import '../../../data/models/contacto_cuidador.dart';
import '../../../data/repositories/contacto_cuidador_repository.dart';

final contactoCuidadorRepositoryProvider = Provider<ContactoCuidadorRepository>((ref) {
  return ContactoCuidadorRepository(ref.watch(isarInstanceProvider));
});

final contactoCuidadorListProvider = StreamProvider<List<ContactoCuidador>>((ref) {
  return ref.watch(contactoCuidadorRepositoryProvider).watchTodos();
});
