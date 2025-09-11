import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest_all.dart' as tz;

// Global instance of notification plugin
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

/// Initialize notification plugin and request permission
Future<void> initNotifications() async {
  // Initialize timezone package
  tz.initializeTimeZones();
  print("Timezones initialized");

  // Android initialization settings
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  // Initialize plugin
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (details) {
      // Optional: handle tap on notification
      print('Notification clicked: ${details.payload}');
    },
  );
  print("Notification plugin initialized");

  // Request notification permission (Android 13+)
  if (await Permission.notification.isDenied) {
    final status = await Permission.notification.request();
    print("Notification permission status: $status");
  } else {
    print("Notification permission already granted");
  }
}

/// Show an immediate notification
Future<void> showNotification({
  required String title,
  required String body,
  String? payload,
}) async {
  print("showNotification called with title: $title, body: $body");

  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'default_channel_id',
    'Default Notifications',
    channelDescription: 'Channel for immediate notifications',
    importance: Importance.max,
    priority: Priority.high,
    playSound: true,
    enableVibration: true,
  );

  const NotificationDetails platformDetails =
      NotificationDetails(android: androidDetails);

  await flutterLocalNotificationsPlugin.show(
    0,
    title,
    body,
    platformDetails,
    payload: payload,
  );
}

/// Schedule a notification for a specific time
Future<void> scheduleNotification({
  required int id,
  required String title,
  required String body,
  required DateTime scheduledTime,
  String? payload,
}) async {
  print(
      "scheduleNotification called with id: $id, title: $title, scheduledTime: $scheduledTime");

  final tz.TZDateTime tzScheduled =
      tz.TZDateTime.from(scheduledTime, tz.local);

  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'scheduled_channel_id',
    'Scheduled Notifications',
    channelDescription: 'Channel for scheduled notifications',
    importance: Importance.max,
    priority: Priority.high,
    playSound: true,
    enableVibration: true,
  );

  const NotificationDetails platformDetails =
      NotificationDetails(android: androidDetails);

  await flutterLocalNotificationsPlugin.zonedSchedule(
    id,
    title,
    body,
    tzScheduled,
    platformDetails,
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
    payload: payload,
  );
}
