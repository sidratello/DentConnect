import 'package:flutter/foundation.dart';
import 'package:signalr_core/signalr_core.dart';

import 'package:template/auth/local_notification_service.dart';

class NotificationService {
  static final NotificationService
      _instance =
      NotificationService._internal();

  factory NotificationService() =>
      _instance;

  NotificationService._internal();

  HubConnection? _hubConnection;

  bool _started = false;

  bool get isConnected =>
      _started;

  Future<void> startConnection(
    String token,
  ) async {
    if (_started) {
      debugPrint(
        '⚠️ SignalR already connected.',
      );

      return;
    }

    if (token.trim().isEmpty) {
      debugPrint(
        '❌ SignalR token is empty.',
      );

      return;
    }

    // =====================================================
    // Create SignalR connection
    // =====================================================

    _hubConnection =
        HubConnectionBuilder()
            .withUrl(
              'http://192.168.1.3:44334/notificationHub',
              HttpConnectionOptions(
                accessTokenFactory:
                    () async => token,
              ),
            )
            .withAutomaticReconnect()
            .build();

    // =====================================================
    // Connection lifecycle
    // =====================================================

    _hubConnection!.onclose(
      (error) {
        _started = false;

        debugPrint(
          '❌ SignalR closed: $error',
        );
      },
    );

    _hubConnection!.onreconnecting(
      (error) {
        debugPrint(
          '🔄 SignalR reconnecting: '
          '$error',
        );
      },
    );

    _hubConnection!.onreconnected(
      (connectionId) {
        _started = true;

        debugPrint(
          '✅ SignalR reconnected: '
          '$connectionId',
        );
      },
    );

    // =====================================================
    // Event 1
    //
    // General notifications:
    // connection requests, complaints, etc.
    // Backend:
    // SendAsync("ReceiveNotification", ...)
    // =====================================================
    _hubConnection!.on(
      'ReceiveNotification',
      (arguments) {
        _handleGeneralNotification(
          arguments,
        );
      },
    );

    // =====================================================
    // Event 2
    //
    // Order notifications.
    // Example: doctor cancelled an order.
    //
    // Backend:
    // SendAsync("ReceiveOrderNotification", ...)
    // =====================================================

_hubConnection!.on(
  'ReceiveOrderNotification',
  (arguments) {
    _handleReceiveOrderNotification(
      arguments,
    );
  },
);
    // =====================================================
    // Start connection
    // =====================================================

    try {
      await _hubConnection!
          .start();

      _started = true;

      debugPrint(
        '✅ SignalR Connected',
      );
    } catch (
      error,
      stackTrace
    ) {
      _started = false;

      debugPrint(
        '❌ SignalR connection error: '
        '$error',
      );

      debugPrint(
        '$stackTrace',
      );
    }
  }

  // =====================================================
  // Common handler for both events
  // =====================================================
void _handleGeneralNotification(
  List<Object?>? arguments,
) {
  if (arguments == null ||
      arguments.isEmpty) {
    debugPrint(
      '⚠️ ReceiveNotification without data',
    );
    return;
  }

  try {
    final rawData =
        arguments.first;

    debugPrint(
      '================ GENERAL NOTIFICATION =================',
    );

    debugPrint(
      'Raw data: $rawData',
    );

    if (rawData is! Map) {
      debugPrint(
        '❌ Invalid notification format',
      );
      return;
    }

    final data =
        Map<String, dynamic>.from(
      rawData,
    );

    final notificationData =
        data['data'] ??
        data['Data'];

    final backendMessage =
        data['message'] ??
        data['Message'];

    String title =
        'إشعار جديد';

    String message =
        backendMessage
                ?.toString() ??
            'لديك إشعار جديد';

    if (notificationData is Map) {
      final payload =
          Map<String, dynamic>.from(
        notificationData,
      );

      debugPrint(
        'Notification Data: $payload',
      );

      // Complaint
      final dentistId =
          payload['dentistId'] ??
          payload['DentistId'];

      final complaintTitle =
          payload['title'] ??
          payload['Title'];

      if (dentistId != null) {
        title =
            'شكوى جديدة';

        if (backendMessage == null &&
            complaintTitle != null) {
          message =
              'شكوى جديدة: $complaintTitle';
        }
      }

      // Advertisement
      final advertisementId =
          payload['advertisementId'] ??
          payload['AdvertisementId'];

      if (advertisementId != null) {
        title =
            'تحديث الإعلان';

        if (backendMessage == null &&
            complaintTitle != null) {
          message =
              'تم تحديث حالة إعلانك: $complaintTitle';
        }
      }
    }

    debugPrint(
      'Notification Id: '
      '${data['id'] ?? data['Id']}',
    );

    debugPrint(
      'Notification Type: '
      '${data['type'] ?? data['Type']}',
    );

    debugPrint(
      'Message: $message',
    );

    debugPrint(
      '=======================================================',
    );

    _showLocalNotification(
      title: title,
      body: message,
    );
  } catch (
    error,
    stackTrace
  ) {
    debugPrint(
      '❌ General notification error: '
      '$error',
    );

    debugPrint(
      '$stackTrace',
    );
  }
}


  // =====================================================
  // ReceiveOrderNotification
  // Doctor sends order
  // =====================================================
void _handleReceiveOrderNotification(
  List<Object?>? arguments,
) {
  if (arguments == null ||
      arguments.isEmpty) {
    debugPrint(
      '⚠️ ReceiveOrderNotification without data',
    );
    return;
  }

  try {
    final rawData =
        arguments.first;

    debugPrint(
      '================ SIGNALR NOTIFICATION =================',
    );

    debugPrint(
      'Raw data: $rawData',
    );

    if (rawData is! Map) {
      debugPrint(
        '❌ Invalid notification format',
      );
      return;
    }

    final data =
        Map<String, dynamic>.from(
      rawData,
    );

    final notificationData =
        data['data'] ??
        data['Data'];

    final backendMessage =
        data['message'] ??
        data['Message'];

    String title =
        'إشعار جديد';

    String message =
        backendMessage
                ?.toString() ??
            'لديك إشعار جديد';

    // =====================================================
    // Detect notification type from Data
    // =====================================================

    if (notificationData is Map) {
      final payload =
          Map<String, dynamic>.from(
        notificationData,
      );

      debugPrint(
        'Notification Data: $payload',
      );

      // ---------------------------------------------
      // Blog / Post notification
      // ---------------------------------------------

      final postId =
          payload['postId'] ??
          payload['PostId'];

      if (postId != null) {
        title =
            'تحديث المنشور';

        final postTitle =
            payload['title'] ??
            payload['Title'];

        final status =
            payload['status'] ??
            payload['Status'];

        debugPrint(
          'PostId: $postId',
        );

        debugPrint(
          'Post title: $postTitle',
        );

        debugPrint(
          'Post status: $status',
        );
      }

      // ---------------------------------------------
      // Order notification
      // ---------------------------------------------

      final orderId =
          payload['orderId'] ??
          payload['OrderId'];

      if (orderId != null) {
        title =
            'طلب جديد';

        if (backendMessage == null ||
            backendMessage
                .toString()
                .trim()
                .isEmpty) {
          message =
              'تم إرسال طلب جديد رقم $orderId';
        }

        debugPrint(
          'OrderId: $orderId',
        );
      }

      // ---------------------------------------------
      // Advertisement notification
      // ---------------------------------------------

      final advertisementId =
          payload['advertisementId'] ??
          payload['AdvertisementId'];

      if (advertisementId != null) {
        title =
            'تحديث الإعلان';

        final advertisementTitle =
            payload['title'] ??
            payload['Title'];

        if (backendMessage == null ||
            backendMessage
                .toString()
                .trim()
                .isEmpty) {
          if (advertisementTitle != null) {
            message =
                'تم تحديث حالة إعلانك: $advertisementTitle';
          }
        }

        debugPrint(
          'AdvertisementId: '
          '$advertisementId',
        );
      }
    }

    debugPrint(
      'Notification Id: '
      '${data['id'] ?? data['Id']}',
    );

    debugPrint(
      'Notification Type: '
      '${data['type'] ?? data['Type']}',
    );

    debugPrint(
      'Message: $message',
    );

    debugPrint(
      '=========================================================',
    );

    _showLocalNotification(
      title: title,
      body: message,
    );
  } catch (
    error,
    stackTrace
  ) {
    debugPrint(
      '❌ ReceiveOrderNotification error: '
      '$error',
    );

    debugPrint(
      '$stackTrace',
    );
  }
}

  // =====================================================
  // Android local notification
  // =====================================================

  Future<void> _showLocalNotification({
    required String title,
    required String body,
  }) async {
    if (body.trim().isEmpty) {
      return;
    }

    await LocalNotificationService()
        .showNotification(
      title: title,
      body: body,
    );
  }

 

  // =====================================================
  // Stop SignalR
  // =====================================================

  Future<void>
      stopConnection() async {
    if (_hubConnection == null) {
      _started = false;

      return;
    }

    try {
      await _hubConnection!
          .stop();

      debugPrint(
        '✅ SignalR disconnected',
      );
    } catch (error) {
      debugPrint(
        '❌ SignalR disconnect '
        'error: $error',
      );
    } finally {
      _started = false;

      _hubConnection =
          null;
    }
  }
}