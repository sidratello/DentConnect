class CaseOrderModel {
  final int orderId;
  final String title;
  final String status;
  final String impressionType;
  final bool isUrgent;
  final bool isPaid;
  final DateTime? deliveryDate;
  final String dentistName;
  final List<String> requiredImages;
  final List<String> files;

  CaseOrderModel({
    required this.orderId,
    required this.title,
    required this.status,
    required this.impressionType,
    required this.isUrgent,
    required this.isPaid,
    required this.deliveryDate,
    required this.dentistName,
    required this.requiredImages,
    required this.files,
  });

  factory CaseOrderModel.fromJson(Map<String, dynamic> json) {
    return CaseOrderModel(
      orderId: json['orderId'] ?? 0,
      title: json['title'] ?? '',
      status: json['status'] ?? '',
      impressionType: json['impressionType'] ?? '',
      isUrgent: json['isUrgent'] ?? false,
      isPaid: json['isPaid'] ?? false,
      deliveryDate: json['deliveryDate'] == null
          ? null
          : DateTime.tryParse(json['deliveryDate']),
      dentistName: json['dentistName'] ?? '',
      requiredImages: List<String>.from(json['requiredImages'] ?? []),
      files: List<String>.from(json['files'] ?? []),
    );
  }

String get displayImage {
  if (requiredImages.isNotEmpty) {
    return requiredImages.last; // Show the latest uploaded image
  }

  return '';
}
}