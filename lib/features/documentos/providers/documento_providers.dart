import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/local/isar_providers.dart';
import '../../../data/models/registo_documento.dart';
import '../../../data/repositories/registo_documento_repository.dart';

final registoDocumentoRepositoryProvider = Provider<RegistoDocumentoRepository>((ref) {
  return RegistoDocumentoRepository(ref.watch(isarInstanceProvider));
});

final documentoListProvider = StreamProvider.family<List<RegistoDocumento>, int>((ref, idosoId) {
  return ref.watch(registoDocumentoRepositoryProvider).watchByIdoso(idosoId);
});
