import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:logger/logger.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static final Logger _logger = Logger();

  Future<void> initializeNotifications() async {
    try {
      tzdata.initializeTimeZones();

      const AndroidInitializationSettings androidSettings =
          AndroidInitializationSettings('notification_icon');

      final DarwinInitializationSettings iosSettings =
          DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
      );

      final InitializationSettings initializationSettings =
          InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      );

      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();

      await _flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
      );

      _logger.i('Notificações inicializadas com sucesso');
    } catch (e, stackTrace) {
      _logger.e('Erro ao inicializar notificações',
          error: e, stackTrace: stackTrace);
    }
  }

  Future<void> _onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) async {
    _logger.d('Notificação recebida: $title');
  }

  void _onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse,
  ) {
    final String? payload = notificationResponse.payload;
    _logger.d('Notificação tocada. Payload: $payload');
  }

  Future<void> showSimpleNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    try {
      const AndroidNotificationDetails androidDetails =
          AndroidNotificationDetails(
        'channel_001',
        'Notificações Gerais',
        channelDescription: 'Canal para notificações gerais da aplicação',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'notification',
      );

      const NotificationDetails notificationDetails = NotificationDetails(
        android: androidDetails,
      );

      await _flutterLocalNotificationsPlugin.show(
        0,
        title,
        body,
        notificationDetails,
        payload: payload,
      );

      _logger.i('Notificação simples enviada');
    } catch (e, stackTrace) {
      _logger.e('Erro ao enviar notificação', error: e, stackTrace: stackTrace);
    }
  }

  Future<void> scheduleNotification({
    required String title,
    required String body,
    required DateTime scheduledDate,
    String? payload,
  }) async {
    try {
      const AndroidNotificationDetails androidDetails =
          AndroidNotificationDetails(
        'channel_002',
        'Notificações Agendadas',
        channelDescription: 'Canal para notificações agendadas da aplicação',
        importance: Importance.max,
        priority: Priority.high,
      );

      const NotificationDetails notificationDetails = NotificationDetails(
        android: androidDetails,
      );

      await _flutterLocalNotificationsPlugin.zonedSchedule(
        1,
        title,
        body,
        tz.TZDateTime.from(scheduledDate, tz.local),
        notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: payload,
      );

      _logger.i('Notificação agendada para $scheduledDate');
    } catch (e, stackTrace) {
      _logger.e('Erro ao agendar notificação',
          error: e, stackTrace: stackTrace);
    }
  }

  Future<void> showPeriodicNotification({
    required String title,
    required String body,
    Duration interval = const Duration(minutes: 1),
    String? payload,
  }) async {
    try {
      const AndroidNotificationDetails androidDetails =
          AndroidNotificationDetails(
        'channel_003',
        'Notificações Periódicas',
        channelDescription: 'Canal para notificações periódicas da aplicação',
        importance: Importance.max,
        priority: Priority.high,
      );

      const NotificationDetails notificationDetails = NotificationDetails(
        android: androidDetails,
      );

      await _flutterLocalNotificationsPlugin.periodicallyShow(
        2,
        title,
        body,
        RepeatInterval.everyMinute,
        notificationDetails,
        androidScheduleMode: AndroidScheduleMode.inexact,
        payload: payload,
      );

      _logger.i('Notificação periódica iniciada');
    } catch (e, stackTrace) {
      _logger.e('Erro ao criar notificação periódica',
          error: e, stackTrace: stackTrace);
    }
  }

  Future<void> scheduleDailyNotification({
    required String title,
    required String body,
    required TimeOfDay time,
    String? payload,
  }) async {
    try {
      const AndroidNotificationDetails androidDetails =
          AndroidNotificationDetails(
        'channel_004',
        'Notificações Diárias',
        channelDescription: 'Canal para notificações diárias',
        importance: Importance.max,
        priority: Priority.high,
      );

      const NotificationDetails notificationDetails = NotificationDetails(
        android: androidDetails,
      );

      var now = tz.TZDateTime.now(tz.local);
      var scheduledDate = tz.TZDateTime(
        tz.local,
        now.year,
        now.month,
        now.day,
        time.hour,
        time.minute,
      );

      if (scheduledDate.isBefore(now)) {
        scheduledDate = scheduledDate.add(const Duration(days: 1));
      }

      await _flutterLocalNotificationsPlugin.zonedSchedule(
        3,
        title,
        body,
        scheduledDate,
        notificationDetails,
        matchDateTimeComponents: DateTimeComponents.time,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: payload,
      );

      _logger.i('Notificação diária agendada para ${time.hour}:${time.minute}');
    } catch (e, stackTrace) {
      _logger.e('Erro ao agendar notificação diária',
          error: e, stackTrace: stackTrace);
    }
  }

  Future<void> cancelNotification(int id) async {
    try {
      await _flutterLocalNotificationsPlugin.cancel(id);
      _logger.i('Notificação $id cancelada');
    } catch (e, stackTrace) {
      _logger.e('Erro ao cancelar notificação',
          error: e, stackTrace: stackTrace);
    }
  }

  Future<void> cancelAllNotifications() async {
    try {
      await _flutterLocalNotificationsPlugin.cancelAll();
      _logger.i('Todas as notificações foram canceladas');
    } catch (e, stackTrace) {
      _logger.e('Erro ao cancelar notificações',
          error: e, stackTrace: stackTrace);
    }
  }

  Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    try {
      return await _flutterLocalNotificationsPlugin
          .pendingNotificationRequests();
    } catch (e, stackTrace) {
      _logger.e('Erro ao obter notificações pendentes',
          error: e, stackTrace: stackTrace);
      return [];
    }
  }
}
