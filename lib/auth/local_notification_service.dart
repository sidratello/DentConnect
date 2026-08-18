import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io';

class LocalNotificationService {
  static final LocalNotificationService
      _instance =
      LocalNotificationService._internal();

  factory LocalNotificationService() =>
      _instance;

  LocalNotificationService._internal();

  final FlutterLocalNotificationsPlugin
      _notifications =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {


        if (!Platform.isAndroid) {
      return;
    }

    const androidSettings =
        AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    final settings =
        InitializationSettings(
      android: androidSettings,
    );

    await _notifications.initialize(
      settings: settings,
    );

    // طلب صلاحية الإشعارات في Android الحديث.
    await _notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  Future<void> showNotification({
    required String title,
    required String body,
  }) async {
        if (!Platform.isAndroid) {
      return;
    }
    if (body.trim().isEmpty) {
      return;
    }

    const androidDetails =
        AndroidNotificationDetails(
      'general_notifications',
      'الإشعارات',
      channelDescription:
          'إشعارات التطبيق',
      importance: Importance.max,
      priority: Priority.high,
    );

    const details =
        NotificationDetails(
      android: androidDetails,
    );

    await _notifications.show(
      id: DateTime.now()
          .millisecondsSinceEpoch
          .remainder(100000),

      title: title,

      body: body,

      notificationDetails:
          details,
    );
  }
}