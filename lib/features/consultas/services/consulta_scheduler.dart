import '../../../core/services/notification_ids.dart';
import '../../../core/services/notification_service.dart';
import '../../../data/models/registo_consulta.dart';
import '../../../l10n/app_localizations.dart';

/// Agenda e cancela os lembretes pontuais (não recorrentes) de uma
/// [RegistoConsulta]: um para a data da consulta e, se existir, outro para
/// a data da consulta de seguimento — só quando essas datas ainda estão no
/// futuro.
class ConsultaScheduler {
  ConsultaScheduler._();

  static Future<void> reagendar(
    RegistoConsulta consulta, {
    required String nomeIdoso,
    required AppLocalizations l10n,
  }) async {
    await cancelar(consulta);

    if (!consulta.lembreteAtivo) {
      consulta.notificacaoIds = [];
      return;
    }

    if (consulta.recorrente) {
      consulta.notificacaoIds = await _reagendarRecorrente(consulta, nomeIdoso: nomeIdoso, l10n: l10n);
      return;
    }

    final agora = DateTime.now();
    final novosIds = <int>[];
    var indice = 0;

    if (consulta.dataHora.isAfter(agora)) {
      final id = NotificationIds.consulta(consulta.id, indice++);
      await NotificationService.instance.agendarUnico(
        id: id,
        titulo: l10n.notificacaoConsultaTitulo(nomeIdoso),
        corpo: consulta.local == null ? consulta.especialidade : '${consulta.especialidade} — ${consulta.local}',
        data: consulta.dataHora,
      );
      novosIds.add(id);
    }

    final proxima = consulta.proximaConsultaData;
    if (proxima != null && proxima.isAfter(agora)) {
      final id = NotificationIds.consulta(consulta.id, indice++);
      await NotificationService.instance.agendarUnico(
        id: id,
        titulo: l10n.notificacaoProximaConsultaTitulo(nomeIdoso),
        corpo: consulta.especialidade,
        data: DateTime(proxima.year, proxima.month, proxima.day, 9),
      );
      novosIds.add(id);
    }

    consulta.notificacaoIds = novosIds;
  }

  static Future<List<int>> _reagendarRecorrente(
    RegistoConsulta consulta, {
    required String nomeIdoso,
    required AppLocalizations l10n,
  }) async {
    final titulo = l10n.notificacaoTratamentoTitulo(nomeIdoso);
    final corpo =
        consulta.local == null ? consulta.especialidade : '${consulta.especialidade} — ${consulta.local}';
    final hora = consulta.dataHora.hour;
    final minuto = consulta.dataHora.minute;

    final novosIds = <int>[];
    var indice = 0;

    if (consulta.diasSemanaRecorrencia.isEmpty) {
      final id = NotificationIds.consulta(consulta.id, indice++);
      await NotificationService.instance.agendarRecorrenteDiario(
        id: id,
        titulo: titulo,
        corpo: corpo,
        hora: hora,
        minuto: minuto,
      );
      novosIds.add(id);
    } else {
      for (final diaSemana in consulta.diasSemanaRecorrencia) {
        final id = NotificationIds.consulta(consulta.id, indice++);
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
    return novosIds;
  }

  static Future<void> cancelar(RegistoConsulta consulta) async {
    for (final id in consulta.notificacaoIds) {
      await NotificationService.instance.cancelar(id);
    }
  }
}
