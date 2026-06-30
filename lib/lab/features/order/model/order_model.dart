// class LabOrderModel {
//   final int orderId;
//   final String title;
//   final String status;
//   final String impressionStage;
//   final String impressionType;
//   final String shade;
//   final bool isTemporary;
//   final bool isUrgent;
//   final DateTime deliveryDate;
//   final String notes;
//   final double estimatedPrice;
//   final double? finalPrice;
//   final DateTime createdAt;
//   final bool hasAccessories;

//   final int dentistId;
//   final String dentistName;
//   final String dentistEmail;
//   final String dentistPhone;
//   final String dentistClinicAddress;

//   final int labId;

//   final List<LabOrderItemModel> items;
//   final List<String> requiredImages;
//   final List<LabOrderFileModel> files;

//   LabOrderModel({
//     required this.orderId,
//     required this.title,
//     required this.status,
//     required this.impressionStage,
//     required this.impressionType,
//     required this.shade,
//     required this.isTemporary,
//     required this.isUrgent,
//     required this.deliveryDate,
//     required this.notes,
//     required this.estimatedPrice,
//     this.finalPrice,
//     required this.createdAt,
//     required this.hasAccessories,
//     required this.dentistId,
//     required this.dentistName,
//     required this.dentistEmail,
//     required this.dentistPhone,
//     required this.dentistClinicAddress,
//     required this.labId,
//     required this.items,
//     required this.requiredImages,
//     required this.files,
//   });

//   factory LabOrderModel.fromJson(Map<String, dynamic> json) {
//     return LabOrderModel(
//       orderId: json['orderId'] ?? 0,
//       title: json['title'] ?? '',
//       status: json['status'] ?? '',
//       impressionStage: json['impressionStage'] ?? '',
//       impressionType: json['impressionType'] ?? '',
//       shade: json['shade'] ?? '',
//       isTemporary: json['isTemporary'] ?? false,
//       isUrgent: json['isUrgent'] ?? false,
//       deliveryDate: DateTime.parse(json['deliveryDate']),
//       notes: json['notes'] ?? '',
//       estimatedPrice: (json['estimatedPrice'] ?? 0).toDouble(),
//       finalPrice: json['finalPrice'] == null
//           ? null
//           : (json['finalPrice'] as num).toDouble(),
//       createdAt: DateTime.parse(json['createdAt']),
//       hasAccessories: json['hasAccessories'] ?? false,
//       dentistId: json['dentistId'] ?? 0,
//       dentistName: json['dentistName'] ?? '',
//       dentistEmail: json['dentistEmail'] ?? '',
//       dentistPhone: json['dentistPhone'] ?? '',
//       dentistClinicAddress: json['dentistClinicAddress'] ?? '',
//       labId: json['labId'] ?? 0,
//       items: (json['items'] as List<dynamic>? ?? [])
//           .map((e) => LabOrderItemModel.fromJson(e))
//           .toList(),
//       requiredImages: (json['requiredImages'] as List<dynamic>? ?? [])
//           .map((e) => e.toString())
//           .toList(),
//       files: (json['files'] as List<dynamic>? ?? [])
//           .map((e) => LabOrderFileModel.fromJson(e))
//           .toList(),
//     );
//   }
// }

// class LabOrderItemModel {
//   final int itemId;
//   final String compensationType;
//   final List<int> toothNumbers;

//   LabOrderItemModel({
//     required this.itemId,
//     required this.compensationType,
//     required this.toothNumbers,
//   });

//   factory LabOrderItemModel.fromJson(Map<String, dynamic> json) {
//     return LabOrderItemModel(
//       itemId: json['itemId'] ?? 0,
//       compensationType: json['compensationType'] ?? '',
//       toothNumbers: (json['toothNumbers'] as List<dynamic>? ?? [])
//           .map((e) => e as int)
//           .toList(),
//     );
//   }
// }

// class LabOrderFileModel {
//   final int id;
//   final String path;
//   final String type;
//   final DateTime uploadedAt;

//   LabOrderFileModel({
//     required this.id,
//     required this.path,
//     required this.type,
//     required this.uploadedAt,
//   });

//   factory LabOrderFileModel.fromJson(Map<String, dynamic> json) {
//     return LabOrderFileModel(
//       id: json['id'] ?? 0,
//       path: json['path'] ?? '',
//       type: json['type'] ?? '',
//       uploadedAt: DateTime.parse(json['uploadedAt']),
//     );
//   }
// }