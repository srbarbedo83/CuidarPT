import 'package:isar_community/isar.dart';

import '../../../data/repositories/idoso_repository.dart';
import '../../../data/repositories/registo_consulta_repository.dart';
import '../../../l10n/app_localizations.dart';
import 'consulta_scheduler.dart';

/// Reagenda os lembretes de consultas ativos.
///
/// Tal como os de medicação, os alarmes não sobrevivem a um reinício do
/// telemóvel, por isso chamamos isto sempre que a app arranca.
Future<void> reagendarLembretesConsultasPendentes(Isar isar, AppLocalizations l10n) async {
  final consultaRepository = RegistoConsultaRepository(isar);
  final comLembrete = await consultaRepository.listarComLembreteAtivo();
  if (comLembrete.isEmpty) return;

  final idosoRepository = IdosoRepository(isar);
  for (final consulta in comLembrete) {
    final idoso = await idosoRepository.getById(consulta.idosoId);
    if (idoso == null) continue;
    await ConsultaScheduler.reagendar(consulta, nomeIdoso: idoso.nome, l10n: l10n);
    await consultaRepository.save(consulta);
  }
}
