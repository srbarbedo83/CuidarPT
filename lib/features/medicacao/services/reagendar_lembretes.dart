import 'package:isar_community/isar.dart';

import '../../../data/repositories/idoso_repository.dart';
import '../../../data/repositories/registo_medicacao_repository.dart';
import 'medicacao_scheduler.dart';

/// Reagenda os lembretes de medicação ativos.
///
/// Alarmes agendados no Android não sobrevivem a um reinício do telemóvel,
/// por isso chamamos isto sempre que a app arranca — assim, os lembretes
/// voltam a ficar ativos assim que o utilizador abre a app, mesmo que o
/// telemóvel tenha sido reiniciado entretanto.
Future<void> reagendarLembretesMedicacaoPendentes(Isar isar) async {
  final medicacaoRepository = RegistoMedicacaoRepository(isar);
  final ativos = await medicacaoRepository.listarAtivos();
  if (ativos.isEmpty) return;

  final idosoRepository = IdosoRepository(isar);
  for (final registo in ativos) {
    final idoso = await idosoRepository.getById(registo.idosoId);
    if (idoso == null) continue;
    await MedicacaoScheduler.reagendar(registo, nomeIdoso: idoso.nome);
    await medicacaoRepository.save(registo);
  }
}
