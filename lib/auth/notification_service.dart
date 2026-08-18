import 'package:flutter/foundation.dart';
import 'package:signalr_core/signalr_core.dart';

import 'package:template/auth/local_notification_service.dart';
import 'package:template/core/widgets/app_notification.dart';

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
        _handleNotification(
          eventName:
              'ReceiveNotification',
          arguments:
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
        _handleNotification(
          eventName:
              'ReceiveOrderNotification',
          arguments:
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

  void _handleNotification({
    required String eventName,
    required List<Object?>? arguments,
  }) {
    if (arguments == null ||
        arguments.isEmpty) {
      debugPrint(
        '⚠️ $eventName received '
        'without data.',
      );

      return;
    }

    try {
      debugPrint(
        '🔔 Event: $eventName',
      );

      debugPrint(
        '🔔 Raw SignalR arguments: '
        '$arguments',
      );

      final rawData =
          arguments.first;

      final notification =
          AppNotification
              .fromSignalR(
        rawData,
      );

      debugPrint(
        '---------------- SIGNALR NOTIFICATION ----------------',
      );

      debugPrint(
        'Event: $eventName',
      );

      debugPrint(
        'ID: ${notification.id}',
      );

      debugPrint(
        'Type: ${notification.type}',
      );

      debugPrint(
        'Message: '
        '${notification.message}',
      );

      debugPrint(
        'OrderId: '
        '${notification.orderId}',
      );

      debugPrint(
        'LabId: '
        '${notification.labId}',
      );

      debugPrint(
        'CreatedAt: '
        '${notification.createdAt}',
      );

      debugPrint(
        '--------------------------------------------------------',
      );

      _showLocalNotification(
        notification,
      );
    } catch (
      error,
      stackTrace
    ) {
      debugPrint(
        '❌ Notification parse '
        'error: $error',
      );

      debugPrint(
        '$stackTrace',
      );
    }
  }

  // =====================================================
  // Show Android notification
  // =====================================================

  Future<void>
      _showLocalNotification(
    AppNotification notification,
  ) async {
    if (notification.message
        .trim()
        .isEmpty) {
      return;
    }

    await LocalNotificationService()
        .showNotification(
      // أنت تريد العنوان ثابتاً
      title: 'إشعار جديد',

      body:
          notification.message,
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