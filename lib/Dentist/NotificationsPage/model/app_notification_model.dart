class AppNotificationModel {
  final int id;
  final String message;
  final String type;
  final bool isRead;
  final DateTime createdAt;

  final int? orderId;
  final int? labId;
  final int? blogPostId;

  const AppNotificationModel({
    required this.id,
    required this.message,
    required this.type,
    required this.isRead,
    required this.createdAt,
    this.orderId,
    this.labId,
    this.blogPostId,
  });

  factory AppNotificationModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return AppNotificationModel(
      id: json['id'] as int,
      message: json['message']?.toString() ?? '',
      type: json['type']?.toString() ?? '',
      isRead: json['isRead'] as bool? ?? false,
      createdAt: DateTime.parse(
        json['createdAt'].toString(),
      ),
      orderId: json['orderId'] as int?,
      labId: json['labId'] as int?,
      blogPostId: json['blogPostId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'message': message,
      'type': type,
      'isRead': isRead,
      'createdAt': createdAt.toIso8601String(),
      'orderId': orderId,
      'labId': labId,
      'blogPostId': blogPostId,
    };
  }
}
