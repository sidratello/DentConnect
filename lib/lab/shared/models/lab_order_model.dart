import 'package:intl/intl.dart';

class LabOrderModel {
  final int orderId;
  final String title;
  final String status;
  final String impressionStage;
  final String impressionType;
  final String shade;
  final bool isTemporary;
  final bool isUrgent;
  final bool isPaid;
  final DateTime? deliveryDate;
  final String notes;
  final double estimatedPrice;
  final double? finalPrice;
  final DateTime? createdAt;
  final bool hasAccessories;

  final int dentistId;
  final String dentistName;
  final String dentistEmail;
  final String dentistPhone;
  final String dentistClinicAddress;

  final int labId;

  final List<LabOrderItemModel> items;
  final List<String> requiredImages;
  final List<LabOrderFileModel> files;

  LabOrderModel({
    required this.orderId,
    required this.title,
    required this.status,
    required this.impressionStage,
    required this.impressionType,
    required this.shade,
    required this.isTemporary,
    required this.isUrgent,
    required this.isPaid,
    required this.deliveryDate,
    required this.notes,
    required this.estimatedPrice,
    this.finalPrice,
    required this.createdAt,
    required this.hasAccessories,
    required this.dentistId,
    required this.dentistName,
    required this.dentistEmail,
    required this.dentistPhone,
    required this.dentistClinicAddress,
    required this.labId,
    required this.items,
    required this.requiredImages,
    required this.files,
  });

  factory LabOrderModel.fromJson(Map<String, dynamic> json) {
    return LabOrderModel(
      orderId: json['orderId'] ?? 0,
      title: (json['title'] ?? '').toString(),
      status: (json['status'] ?? '').toString(),
      impressionStage: (json['impressionStage'] ?? '').toString(),
      impressionType: (json['impressionType'] ?? '').toString(),
      shade: (json['shade'] ?? '').toString(),
      isTemporary: json['isTemporary'] ?? false,
      isUrgent: json['isUrgent'] ?? false,
      isPaid: json['isPaid'] ?? false,
      deliveryDate: json['deliveryDate'] == null
          ? null
          : DateTime.tryParse(json['deliveryDate'].toString()),
      notes: (json['notes'] ?? '').toString(),
      estimatedPrice: (json['estimatedPrice'] as num? ?? 0).toDouble(),
      finalPrice: json['finalPrice'] == null
          ? null
          : (json['finalPrice'] as num).toDouble(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.tryParse(json['createdAt'].toString()),
      hasAccessories: json['hasAccessories'] ?? false,
      dentistId: json['dentistId'] ?? 0,
      dentistName: (json['dentistName'] ?? '').toString(),
      dentistEmail: (json['dentistEmail'] ?? '').toString(),
      dentistPhone: (json['dentistPhone'] ?? '').toString(),
      dentistClinicAddress: (json['dentistClinicAddress'] ?? '').toString(),
      labId: json['labId'] ?? 0,
      items: (json['items'] as List? ?? [])
          .map((e) => LabOrderItemModel.fromJson(e))
          .toList(),
      requiredImages: (json['requiredImages'] as List? ?? [])
          .map((e) => e.toString())
          .toList(),
      files: (json['files'] as List? ?? [])
          .map((e) => LabOrderFileModel.fromJson(e))
          .toList(),
    );
  }

  String get displayImage {
    if (requiredImages.isNotEmpty) {
      return requiredImages.last;
    }
    return '';
  }

  bool get hasStlFiles {
    return impressionType == 'Digital' && files.isNotEmpty;
  }
  String get formattedDeliveryDate {
  if (deliveryDate == null) return '-';

  return DateFormat('yyyy-MM-dd').format(deliveryDate!);
}
}

class LabOrderItemModel {
  final int itemId;
  final String compensationType;
  final List<int> toothNumbers;

  LabOrderItemModel({
    required this.itemId,
    required this.compensationType,
    required this.toothNumbers,
  });

  factory LabOrderItemModel.fromJson(Map<String, dynamic> json) {
    return LabOrderItemModel(
      itemId: json['itemId'] ?? 0,
      compensationType: (json['compensationType'] ?? '').toString(),
      toothNumbers: (json['toothNumbers'] as List? ?? [])
          .map((e) => int.tryParse(e.toString()) ?? 0)
          .where((e) => e != 0)
          .toList(),
    );
  }
}

class LabOrderFileModel {
  final int id;
  final String path;
  final String type;
  final DateTime? uploadedAt;

  LabOrderFileModel({
    required this.id,
    required this.path,
    required this.type,
    required this.uploadedAt,
  });

  factory LabOrderFileModel.fromJson(Map<String, dynamic> json) {
    return LabOrderFileModel(
      id: json['id'] ?? 0,
      path: (json['path'] ?? '').toString(),
      type: (json['type'] ?? '').toString(),
      uploadedAt: json['uploadedAt'] == null
          ? null
          : DateTime.tryParse(json['uploadedAt'].toString()),
    );
  }

  String get fileName {
    return path.split('/').last;
  }
  
}