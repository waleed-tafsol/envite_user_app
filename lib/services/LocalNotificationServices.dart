import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  // Singleton pattern to avoid multiple instances
  static final LocalNotificationService _instance =
      LocalNotificationService._internal();
  factory LocalNotificationService() => _instance;

  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  // Private constructor to initialize the plugin
  LocalNotificationService._internal() {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  }

  // Initialize local notifications
  Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher'); // Your app's icon

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // Show a simple notification
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'This is the channel for local notifications',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      platformDetails,
    );
  }

  // Show a scheduled notification (delayed)
  // Future<void> showScheduledNotification({
  //   required int id,
  //   required String title,
  //   required String body,
  //   required DateTime scheduledTime,
  // }) async {
  //   const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
  //     'channel_id',
  //     'channel_name',
  //     channelDescription: 'This is the channel for local notifications',
  //     importance: Importance.max,
  //     priority: Priority.high,
  //     ticker: 'ticker',
  //   );
  //   const NotificationDetails platformDetails = NotificationDetails(
  //     android: androidDetails,
  //   );

  //   // await _flutterLocalNotificationsPlugin.zonedSchedule(
  //   //   id,
  //   //   title,
  //   //   body,
  //   //   scheduledTime,
  //   //   platformDetails,
  //   //   androidAllowWhileIdle: true, // Allow notification when the phone is idle
  //   //   uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.wallClockTime,
  //   //   matchDateTimeComponents: DateTimeComponents.time,
  //   // );
  // }

  // Cancel a notification
  Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  // Cancel all notifications
  Future<void> cancelAllNotifications() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}
