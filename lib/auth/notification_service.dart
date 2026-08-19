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
          '🔄 SignalR reconnecting: $error',
        );
      },
    );

    _hubConnection!.onreconnected(
      (connectionId) {
        _started = true;

        debugPrint(
          '✅ SignalR reconnected: $connectionId',
        );
      },
    );

    // =====================================================
    // Event 1
    // =====================================================

    _hubConnection!.on(
      'ReceiveNotification',
      (arguments) {
        _handleNotification(
          eventName: 'ReceiveNotification',
          arguments: arguments,
        );
      },
    );

    // =====================================================
    // Event 2
    // =====================================================

    _hubConnection!.on(
      'ReceiveOrderNotification',
      (arguments) {
        _handleNotification(
          eventName:
              'ReceiveOrderNotification',
          arguments: arguments,
        );
      },
    );

    // =====================================================
    // Start connection
    // =====================================================

    try {
      await _hubConnection!.start();

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
        '❌ SignalR connection error: $error',
      );

      debugPrint(
        '$stackTrace',
      );
    }
  }

  // =====================================================
  // Generic notification handler
  //
  // Supports:
  // String
  // Map / JSON
  // =====================================================

  void _handleNotification({
    required String eventName,
    required List<Object?>?
        arguments,
  }) {
    if (arguments == null ||
        arguments.isEmpty) {
      debugPrint(
        '⚠️ $eventName received without data',
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
        'Event: $eventName',
      );

      debugPrint(
        'Raw data: $rawData',
      );

      debugPrint(
        'Raw type: ${rawData.runtimeType}',
      );

      // ===================================================
      // CASE 1:
      // Backend sends String directly
      // ===================================================

      if (rawData is String) {
        final message =
            rawData.trim();

        if (message.isEmpty) {
          debugPrint(
            '⚠️ Notification String is empty',
          );

          return;
        }

        debugPrint(
          'Notification format: String',
        );

        debugPrint(
          'Message: $message',
        );

        debugPrint(
          '========================================================',
        );

        _showLocalNotification(
          title: 'إشعار جديد',
          body: message,
          data: null,
        );

        return;
      }

      // ===================================================
      // CASE 2:
      // Backend sends Map / JSON
      // ===================================================

      if (rawData is Map) {
        final data =
            Map<String, dynamic>.from(
          rawData,
        );

        final id =
            data['id'] ??
            data['Id'];

        final type =
            data['type'] ??
            data['Type'];

        final createdAt =
            data['createdAt'] ??
            data['CreatedAt'];

        final message =
            data['message'] ??
            data['Message'];

      final rawNotificationData =
    data['data'] ??
    data['Data'] ??
    data['requestDetails'] ??
    data['RequestDetails'];

        Map<String, dynamic>?
            notificationData;

        if (rawNotificationData
            is Map) {
          notificationData =
              Map<String, dynamic>.from(
            rawNotificationData,
          );
        }

        debugPrint(
          'Notification format: Map',
        );

        debugPrint(
          'Notification Id: $id',
        );

        debugPrint(
          'Notification Type: $type',
        );

        debugPrint(
          'CreatedAt: $createdAt',
        );

        debugPrint(
          'Message: $message',
        );

        debugPrint(
          'Data: $notificationData',
        );

        debugPrint(
          '========================================================',
        );

        // ===================================================
        // Prepare final message
        // ===================================================

        String finalMessage =
            message
                    ?.toString()
                    .trim() ??
                '';

        // إذا الـ backend لم يرسل message
      if (finalMessage.isEmpty) {
  final notificationTitle =
      notificationData?['title'] ??
      notificationData?['Title'];

  final notificationContent =
      notificationData?['content'] ??
      notificationData?['Content'];

  if (notificationTitle != null &&
      notificationContent != null) {
    finalMessage =
        '${notificationTitle.toString()}\n'
        '${notificationContent.toString()}';
  } else if (notificationTitle != null) {
    finalMessage =
        notificationTitle.toString();
  } else if (notificationContent != null) {
    finalMessage =
        notificationContent.toString();
  } else {
    finalMessage =
        'لديك إشعار جديد';
  }
}
        debugPrint(
          'Final Message: $finalMessage',
        );

        // ===================================================
        // Show only once
        // ===================================================

        _showLocalNotification(
          title: 'إشعار جديد',
          body: finalMessage,
          data: notificationData,
        );

        return;
      }

      // ===================================================
      // Unknown data type
      // ===================================================

      debugPrint(
        '❌ Unsupported notification format: '
        '${rawData.runtimeType}',
      );
    } catch (
      error,
      stackTrace
    ) {
      debugPrint(
        '❌ Notification handling error: $error',
      );

      debugPrint(
        '$stackTrace',
      );
    }
  }

  // =====================================================
  // Show Local Notification
  // =====================================================

  Future<void>
      _showLocalNotification({
    required String title,
    required String body,
    Map<String, dynamic>? data,
  }) async {
    if (body.trim().isEmpty) {
      return;
    }

    try {
      await LocalNotificationService()
          .showNotification(
        title: title,
        body: body,
        data: data,
      );

      debugPrint(
        '✅ Local notification shown',
      );
    } catch (
      error,
      stackTrace
    ) {
      debugPrint(
        '❌ Local notification error: $error',
      );

      debugPrint(
        '$stackTrace',
      );
    }
  }

  // =====================================================
  // Stop connection
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
        '❌ SignalR disconnect error: $error',
      );
    } finally {
      _started = false;

      _hubConnection = null;
    }
  }
}