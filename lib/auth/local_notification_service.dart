import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:template/core/app_router.dart';
import 'package:template/lab/features/lab_ad/model/lab_ad_model.dart';
import 'package:template/lab/features/lab_blog/model/post_model.dart';
import 'package:template/lab/shared/models/lab_order_model.dart';

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
  'notification_icon',
);

    const settings =
        InitializationSettings(
      android: androidSettings,
    );

    await _notifications.initialize(
      settings: settings,

      // عندما يضغط المستخدم على الإشعار
      onDidReceiveNotificationResponse:
          (NotificationResponse response) {
        debugPrint(
          '🔔 Notification clicked',
        );

        debugPrint(
          'Payload: ${response.payload}',
        );

        _handleNotificationClick(
          response.payload,
        );
      },
    );

    // طلب صلاحية الإشعارات
    await _notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  // =====================================================
  // Show notification
  // =====================================================

  Future<void> showNotification({
    required String title,
    required String body,

    // Data القادمة من SignalR
    Map<String, dynamic>? data,
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
       icon: 'notification_icon',
    );

    const details =
        NotificationDetails(
      android: androidDetails,
    );

    // تحويل Data إلى String
    // حتى نخزنها داخل Notification
    String? payload;

    if (data != null &&
        data.isNotEmpty) {
      try {
        payload =
            jsonEncode(data);
      } catch (error) {
        debugPrint(
          '❌ Error converting notification data: $error',
        );
      }
    }

    debugPrint(
      '🔔 Showing notification',
    );

    debugPrint(
      'Title: $title',
    );

    debugPrint(
      'Body: $body',
    );

    debugPrint(
      'Payload: $payload',
    );

    await _notifications.show(
      id: DateTime.now()
          .millisecondsSinceEpoch
          .remainder(100000),

      title: title,

      body: body,

      notificationDetails:
          details,

      // مهم
      payload: payload,
    );
  }

  // =====================================================
  // عندما يضغط المستخدم على Notification
  // =====================================================

  void _handleNotificationClick(
    String? payload,
  ) {
    if (payload == null ||
        payload.trim().isEmpty) {
      debugPrint(
        '⚠️ Notification has no Data',
      );

      return;
    }

    try {
      final decoded =
          jsonDecode(payload);

      if (decoded is! Map) {
        debugPrint(
          '❌ Invalid notification Data',
        );

        return;
      }

      final data =
          Map<String, dynamic>.from(
        decoded,
      );

      debugPrint(
        '================ NOTIFICATION CLICK =================',
      );

      debugPrint(
        'Data: $data',
      );

      debugPrint(
        '=====================================================',
      );

      // ===================================================
      // BLOG
      // إذا Data تحتوي PostId
      // ===================================================

// ===================================================
// BLOG
// ===================================================

final postId =
    data['postId'] ??
    data['PostId'];

if (postId != null) {
  debugPrint(
    '➡️ Blog notification detected',
  );

  debugPrint(
    'PostId: $postId',
  );

  try {
    // تحويل Data القادمة من SignalR
    // إلى BlogPostModel
    final post =
        BlogPostModel.fromJson(
      data,
    );

    debugPrint(
      '✅ BlogPostModel created',
    );

    debugPrint(
      'Post: ${post.title}',
    );

    // إرسال BlogPostModel نفسه
    // وليس Map
    Get.toNamed(
      AppRouter.blogPostDetails,
      arguments: post,
    );
  } catch (error) {
    debugPrint(
      '❌ Error converting notification '
      'data to BlogPostModel: $error',
    );
  }

  return;
}

      // ===================================================
      // ORDER
      // إذا Data تحتوي OrderId
      // ===================================================
// ===================================================
// DOCTOR CONNECTION REQUEST
// ===================================================

final fromDentistId =
    data['fromDentistId'] ??
    data['FromDentistId'];

final toLabId =
    data['toLabId'] ??
    data['ToLabId'];

if (fromDentistId != null &&
    toLabId != null) {
  debugPrint(
    '➡️ Doctor connection request notification',
  );

  debugPrint(
    'Dentist ID: $fromDentistId',
  );

  Get.toNamed(
    AppRouter.orderconection,
  );

  return;
}
   // ===================================================
// ORDER
// ===================================================

final orderId =
    data['orderId'] ??
    data['OrderId'];

if (orderId != null) {
  debugPrint(
    '➡️ Order notification detected',
  );

  debugPrint(
    'Order ID: $orderId',
  );

  try {
    final order =
        LabOrderModel.fromJson(
      data,
    );

    debugPrint(
      '✅ LabOrderModel created',
    );

    debugPrint(
      'Order ID: ${order.orderId}',
    );

    Get.toNamed(
      AppRouter.orderDetails,
      arguments: order,
    );
  } catch (
    error,
    stackTrace
  ) {
    debugPrint(
      '❌ LabOrderModel parse error: $error',
    );

    debugPrint(
      '$stackTrace',
    );
  }

  return;
}
      // ===================================================
      // COMPLAINT
      // إذا Data تحتوي ComplaintId
      // ===================================================

      final complaintId =
          data['complaintId'] ??
          data['ComplaintId'];

      if (complaintId != null) {
        debugPrint(
          '➡️ Go to Complaint: $complaintId',
        );

        Get.toNamed(
          '/complaintDetails',
          arguments: {
            'complaintId':
                complaintId,
          },
        );

        return;
      }

   // ===================================================
// ADVERTISEMENT
// ===================================================

final adId =
    data['id'] ??
    data['Id'];

final userId =
    data['userId'] ??
    data['UserId'];

final price =
    data['price'] ??
    data['Price'];

final isPaid =
    data['isPaid'] ??
    data['IsPaid'];

final isActive =
    data['isActive'] ??
    data['IsActive'];

if (adId != null &&
    userId != null &&
    price != null &&
    isPaid != null &&
    isActive != null) {
  debugPrint(
    '➡️ Advertisement notification detected',
  );

  debugPrint(
    'Advertisement ID: $adId',
  );

  try {
    final advertisement =
        LabAdModel.fromJson(
      data,
    );

    debugPrint(
      '✅ LabAdModel created',
    );

    debugPrint(
      'Advertisement ID: ${advertisement.id}',
    );

    Get.toNamed(
      AppRouter.labAdDetails,
      arguments: advertisement,
    );
  } catch (
    error,
    stackTrace
  ) {
    debugPrint(
      '❌ LabAdModel parse error: $error',
    );

    debugPrint(
      '$stackTrace',
    );
  }

  return;
}
      // ===================================================
      // No rule
      // ===================================================

      debugPrint(
        '⚠️ No screen found for this notification',
      );

      debugPrint(
        'Received Data: $data',
      );
    } catch (
      error,
      stackTrace
    ) {
      debugPrint(
        '❌ Notification click error: $error',
      );

      debugPrint(
        '$stackTrace',
      );
    }
  }
}