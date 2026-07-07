import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/local/isar_providers.dart';
import '../../../data/models/preferencias_app.dart';
import '../../../data/repositories/preferencias_repository.dart';

final preferenciasRepositoryProvider = Provider<PreferenciasRepository>((ref) {
  return PreferenciasRepository(ref.watch(isarInstanceProvider));
});

final preferenciasAppProvider = StreamProvider<PreferenciasApp?>((ref) {
  return ref.watch(preferenciasRepositoryProvider).watch();
});

final temaPreferidoProvider = Provider<TemaPreferido>((ref) {
  return ref.watch(preferenciasAppProvider).valueOrNull?.tema ?? TemaPreferido.sistema;
});

final escalaTextoProvider = Provider<double>((ref) {
  return ref.watch(preferenciasAppProvider).valueOrNull?.escalaTexto ?? 1.0;
});
