import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

/// Lembretes locais, agendados diretamente no dispositivo — sem qualquer
/// servidor de push.
///
/// Usa agendamento inexato (`inexactAllowWhileIdle`) de propósito: a Google
/// tem vindo a restringir a permissão `SCHEDULE_EXACT_ALARM`, e para
/// lembretes de saúde uma variação de poucos minutos é aceitável.
class NotificationService {
  NotificationService._();

  static final NotificationService instance = NotificationService._();

  static const _canalLembretesId = 'lembretes_cuidarpt';

  final _plugin = FlutterLocalNotificationsPlugin();
  bool _inicializado = false;

  Future<void> init() async {
    if (_inicializado) return;

    tz_data.initializeTimeZones();
    final fusoHorario = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(fusoHorario.identifier));

    const inicializacaoAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    await _plugin.initialize(
      settings: const InitializationSettings(android: inicializacaoAndroid),
    );

    await _plugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    _inicializado = true;
  }

  NotificationDetails get _detalhes => const NotificationDetails(
        android: AndroidNotificationDetails(
          _canalLembretesId,
          'Lembretes',
          channelDescription: 'Lembretes de medicação e consultas',
          importance: Importance.high,
          priority: Priority.high,
        ),
      );

  tz.TZDateTime _proximaOcorrencia({required int hora, required int minuto, int? diaSemana}) {
    final agora = tz.TZDateTime.now(tz.local);
    var data = tz.TZDateTime(tz.local, agora.year, agora.month, agora.day, hora, minuto);
    if (diaSemana == null) {
      if (data.isBefore(agora)) {
        data = data.add(const Duration(days: 1));
      }
      return data;
    }
    while (data.weekday != diaSemana || data.isBefore(agora)) {
      data = data.add(const Duration(days: 1));
    }
    return data;
  }

  /// Agenda um lembrete que se repete todos os dias à mesma hora.
  Future<void> agendarRecorrenteDiario({
    required int id,
    required String titulo,
    required String corpo,
    required int hora,
    required int minuto,
  }) async {
    await init();
    await _plugin.zonedSchedule(
      id: id,
      title: titulo,
      body: corpo,
      scheduledDate: _proximaOcorrencia(hora: hora, minuto: minuto),
      notificationDetails: _detalhes,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  /// Agenda um lembrete que se repete toda a semana no mesmo dia e hora.
  /// [diaSemana] segue a convenção de [DateTime.weekday] (1 = segunda).
  Future<void> agendarRecorrenteSemanal({
    required int id,
    required String titulo,
    required String corpo,
    required int diaSemana,
    required int hora,
    required int minuto,
  }) async {
    await init();
    await _plugin.zonedSchedule(
      id: id,
      title: titulo,
      body: corpo,
      scheduledDate: _proximaOcorrencia(hora: hora, minuto: minuto, diaSemana: diaSemana),
      notificationDetails: _detalhes,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );
  }

  Future<void> cancelar(int id) async {
    await init();
    await _plugin.cancel(id: id);
  }
}
