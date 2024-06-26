import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/standalone.dart' as tz;

class LocalNotifications {
  static const _notificationId = 1;
  static const _channelId = 'Schedule_1', _channelName = 'Bills Schedule';
  static LocalNotifications? _instance;
  LocalNotifications._();
  factory LocalNotifications() => _instance ??= LocalNotifications._();

  FlutterLocalNotificationsPlugin localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  AndroidFlutterLocalNotificationsPlugin? androidNotificationsPlugin;

  Future<void> initialize() async {
    androidNotificationsPlugin =
        localNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    AndroidInitializationSettings androidSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    InitializationSettings settings =
        InitializationSettings(android: androidSettings);
    await localNotificationsPlugin.initialize(settings);
  }

  Future<bool?> requestPermission() async {
    if (androidNotificationsPlugin != null) {
      return await androidNotificationsPlugin!.requestNotificationsPermission();
    }
    return false;
  }

  void scheduleNotification(
      String title, String body, DateTime dateTime) async {
    AndroidNotificationDetails androidDetails =
        const AndroidNotificationDetails(_channelId, _channelName);
    NotificationDetails details = NotificationDetails(android: androidDetails);
    await localNotificationsPlugin.zonedSchedule(
      _notificationId,
      title,
      body,
      tz.TZDateTime.from(dateTime, tz.getLocation('Asia/Karachi')),
      details,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
