import '../../../core/services/notification_ids.dart';
import '../../../core/services/notification_service.dart';
import '../../../data/models/registo_consulta.dart';

/// Agenda e cancela os lembretes pontuais (não recorrentes) de uma
/// [RegistoConsulta]: um para a data da consulta e, se existir, outro para
/// a data da consulta de seguimento — só quando essas datas ainda estão no
/// futuro.
class ConsultaScheduler {
  ConsultaScheduler._();

  static Future<void> reagendar(RegistoConsulta consulta, {required String nomeIdoso}) async {
    await cancelar(consulta);

    if (!consulta.lembreteAtivo) {
      consulta.notificacaoIds = [];
      return;
    }

    final agora = DateTime.now();
    final novosIds = <int>[];
    var indice = 0;

    if (consulta.dataHora.isAfter(agora)) {
      final id = NotificationIds.consulta(consulta.id, indice++);
      await NotificationService.instance.agendarUnico(
        id: id,
        titulo: 'Consulta · $nomeIdoso',
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
        titulo: 'Próxima consulta · $nomeIdoso',
        corpo: consulta.especialidade,
        data: DateTime(proxima.year, proxima.month, proxima.day, 9),
      );
      novosIds.add(id);
    }

    consulta.notificacaoIds = novosIds;
  }

  static Future<void> cancelar(RegistoConsulta consulta) async {
    for (final id in consulta.notificacaoIds) {
      await NotificationService.instance.cancelar(id);
    }
  }
}
