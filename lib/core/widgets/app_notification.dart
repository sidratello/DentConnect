class AppNotification {
  final int id;

  final String message;
  final String type;

  final int? orderId;
  final int? labId;

  final DateTime? createdAt;

  const AppNotification({
    required this.id,
    required this.message,
    required this.type,
    this.orderId,
    this.labId,
    this.createdAt,
  });

  factory AppNotification.fromSignalR(
    dynamic data,
  ) {
    if (data is! Map) {
      return AppNotification(
        id: 0,
        message:
            data?.toString() ?? '',
        type: '',
      );
    }

    return AppNotification(
      id: _toInt(
            data['id'] ??
                data['Id'],
          ) ??
          0,

      message:
          (data['message'] ??
                  data['Message'] ??
                  '')
              .toString(),

      type:
          (data['type'] ??
                  data['Type'] ??
                  '')
              .toString(),

      orderId: _toInt(
        data['orderId'] ??
            data['OrderId'],
      ),

      labId: _toInt(
        data['labId'] ??
            data['LabId'],
      ),

      createdAt:
          DateTime.tryParse(
        (data['createdAt'] ??
                data['CreatedAt'] ??
                '')
            .toString(),
      ),
    );
  }

  static int? _toInt(
    dynamic value,
  ) {
    if (value == null) {
      return null;
    }

    if (value is int) {
      return value;
    }

    if (value is num) {
      return value.toInt();
    }

    return int.tryParse(
      value.toString(),
    );
  }

  String get title {
    switch (type) {
      case 'OrderAccepted':
        return 'تم قبول الطلب';

      case 'OrderRejected':
        return 'تم رفض الطلب';

      case 'InfoRequested':
        return 'طلب معلومات إضافية';

      case 'StatusChanged':
        return 'تحديث حالة الطلب';

      case 'PriceSet':
        return 'تم تحديد السعر';

      case 'DeliveryDue':
        return 'موعد التسليم';

      case 'OrderCompleted':
        return 'تم إكمال الطلب';

      case 'Cancellation':
        return 'تم إلغاء الطلب';

      case 'ScanVisitConfirmed':
        return 'تم تأكيد موعد المسح';

      case 'ConnectionAccepted':
        return 'تم قبول الاتصال';

      case 'ConnectionRejected':
        return 'تم رفض الاتصال';

      case 'Disconnected':
        return 'تم قطع الاتصال';

      case 'ComplaintReply':
        return 'رد على الشكوى';

      default:
        return 'إشعار جديد';
    }
  }
}