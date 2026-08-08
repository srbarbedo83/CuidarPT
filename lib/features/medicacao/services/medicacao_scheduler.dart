import '../../../core/services/notification_ids.dart';
import '../../../core/services/notification_service.dart';
import '../../../data/models/registo_medicacao.dart';
import '../../../l10n/app_localizations.dart';

/// Agenda e cancela os lembretes locais de um [RegistoMedicacao].
///
/// Cada combinação de horário (e, se aplicável, dia da semana) tem o seu
/// próprio ID de notificação, guardado em [RegistoMedicacao.notificacaoIds]
/// para poder ser cancelado mais tarde. Os IDs são determinísticos
/// (derivados do ID do registo, ver [NotificationIds]), por isso reagendar
/// produz sempre os mesmos IDs — útil para o reagendamento no arranque da
/// app.
class MedicacaoScheduler {
  MedicacaoScheduler._();

  /// Cancela os lembretes atuais e agenda-os de novo a partir dos dados do
  /// registo. Atualiza `registo.notificacaoIds` — quem chamar deve depois
  /// guardar o registo para persistir os IDs.
  static Future<void> reagendar(
    RegistoMedicacao registo, {
    required String nomeIdoso,
    required AppLocalizations l10n,
  }) async {
    await cancelar(registo);

    if (!registo.ativo || registo.horariosMinutos.isEmpty) {
      registo.notificacaoIds = [];
      return;
    }

    final titulo = l10n.notificacaoMedicacaoTitulo(nomeIdoso);
    final corpo =
        registo.dose == null ? registo.nomeMedicamento : '${registo.nomeMedicamento} — ${registo.dose}';

    final novosIds = <int>[];
    var indice = 0;
    for (final minutos in registo.horariosMinutos) {
      final hora = minutos ~/ 60;
      final minuto = minutos % 60;

      if (registo.diasSemana.isEmpty) {
        final id = NotificationIds.medicacao(registo.id, indice++);
        await NotificationService.instance.agendarRecorrenteDiario(
          id: id,
          titulo: titulo,
          corpo: corpo,
          hora: hora,
          minuto: minuto,
        );
        novosIds.add(id);
      } else {
        for (final diaSemana in registo.diasSemana) {
          final id = NotificationIds.medicacao(registo.id, indice++);
          await NotificationService.instance.agendarRecorrenteSemanal(
            id: id,
            titulo: titulo,
            corpo: corpo,
            diaSemana: diaSemana,
            hora: hora,
            minuto: minuto,
          );
          novosIds.add(id);
        }
      }
    }
    registo.notificacaoIds = novosIds;
  }

  static Future<void> cancelar(RegistoMedicacao registo) async {
    for (final id in registo.notificacaoIds) {
      await NotificationService.instance.cancelar(id);
    }
  }
}
