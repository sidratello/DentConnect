import 'package:template/Dentist/CasesPage/model/case_model.dart';

class CaseDetailsModel {
  int? dentistId;
  double? myRating;
  List<Orders>? orders;

  CaseDetailsModel({
    this.dentistId,
    this.myRating,
    this.orders,
  });

  CaseDetailsModel.fromJson(Map<String, dynamic> json) {
    dentistId = json['dentistId'] ?? 0;
    myRating = (json['labAverageRating'] ?? 0).toDouble();

    if (json['orders'] != null) {
      orders = (json['orders'] as List).map((e) => Orders.fromJson(e)).toList();
    } else {
      orders = <Orders>[];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['dentistId'] = dentistId;
    data['labAverageRating'] = myRating;

    if (orders != null) {
      data['orders'] = orders!.map((e) => e.toJson()).toList();
    }

    return data;
  }
}

class Orders {
  int? id;
  String? title;
  String? status;
  bool? isUrgent;
  String? impressionStage;
  String? impressionType;
  String? shade;
  bool? isTemporary;
  String? deliveryDate;
  String? notes;
  bool? hasAccessories;
  List<String>? requiredImages;
  double? estimatedPrice;
  double? finalPrice;
  bool? isPaid;
  String? createdAt;
  String? patientName;
  PatientDetails? patientDetails;
  List<Items>? items;

  Orders({
    this.id,
    this.title,
    this.status,
    this.isUrgent,
    this.impressionStage,
    this.impressionType,
    this.shade,
    this.isTemporary,
    this.deliveryDate,
    this.notes,
    this.hasAccessories,
    this.requiredImages,
    this.estimatedPrice,
    this.finalPrice,
    this.isPaid,
    this.createdAt,
    this.patientName,
    this.patientDetails,
    this.items,
  });

  Orders.fromCaseItem(CaseItem caseItem) {
    id = caseItem.id ?? 0;
    title = caseItem.title ?? '';
    status = caseItem.status ?? '';
    isUrgent = caseItem.isUrgent ?? false;
    impressionStage = caseItem.impressionStage ?? '';
    impressionType = caseItem.impressionType ?? '';
    shade = caseItem.shade ?? '';
    isTemporary = caseItem.isTemporary ?? false;
    deliveryDate = caseItem.deliveryDate ?? '';
    notes = caseItem.notes ?? '';
    hasAccessories = caseItem.hasAccessories ?? false;
    requiredImages = caseItem.requiredImages ?? <String>[];
    estimatedPrice = caseItem.estimatedPrice ?? 0;
    finalPrice = caseItem.finalPrice ?? 0;
    isPaid = caseItem.isPaid ?? false;
    createdAt = caseItem.createdAt ?? '';
    patientName = ''; // Assuming patientName is not available in CaseItem
    patientDetails = PatientDetails(); // Assuming default PatientDetails
    items = []; // Assuming no items are available in CaseItem
  }

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    title = json['title'] ?? '';
    status = json['status'] ?? '';
    isUrgent = json['isUrgent'] ?? false;
    impressionStage = json['impressionStage'] ?? '';
    impressionType = json['impressionType'] ?? '';
    shade = json['shade'] ?? '';
    isTemporary = json['isTemporary'] ?? false;
    deliveryDate = json['deliveryDate'] ?? '';
    notes = json['notes'] ?? '';
    hasAccessories = json['hasAccessories'] ?? false;

    requiredImages = json['requiredImages'] != null
        ? List<String>.from(json['requiredImages'])
        : <String>[];

    estimatedPrice = json['estimatedPrice'] ?? 0;
    finalPrice = (json['finalPrice'] ?? 0).toDouble();
    isPaid = json['isPaid'] ?? false;
    createdAt = json['createdAt'] ?? '';
    patientName = json['patientName'] ?? '';

    patientDetails = json['patientDetails'] != null
        ? PatientDetails.fromJson(json['patientDetails'])
        : PatientDetails();

    if (json['items'] != null) {
      items = (json['items'] as List).map((e) => Items.fromJson(e)).toList();
    } else {
      items = <Items>[];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['title'] = title;
    data['status'] = status;
    data['isUrgent'] = isUrgent;
    data['impressionStage'] = impressionStage;
    data['impressionType'] = impressionType;
    data['shade'] = shade;
    data['isTemporary'] = isTemporary;
    data['deliveryDate'] = deliveryDate;
    data['notes'] = notes;
    data['hasAccessories'] = hasAccessories;
    data['requiredImages'] = requiredImages;
    data['estimatedPrice'] = estimatedPrice;
    data['finalPrice'] = finalPrice;
    data['isPaid'] = isPaid;
    data['createdAt'] = createdAt;
    data['patientName'] = patientName;

    if (patientDetails != null) {
      data['patientDetails'] = patientDetails!.toJson();
    }

    if (items != null) {
      data['items'] = items!.map((e) => e.toJson()).toList();
    }

    return data;
  }
}

class PatientDetails {
  int? id;
  int? age;
  String? clinicalNotes;

  PatientDetails({
    this.id,
    this.age,
    this.clinicalNotes,
  });

  PatientDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    age = json['age'] ?? 0;
    clinicalNotes = json['clinicalNotes'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['age'] = age;
    data['clinicalNotes'] = clinicalNotes;

    return data;
  }
}

class Items {
  int? id;
  String? compensationType;
  List<int>? toothNumbers;

  Items({
    this.id,
    this.compensationType,
    this.toothNumbers,
  });

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    compensationType = json['compensationType'] ?? '';

    toothNumbers = json['toothNumbers'] != null
        ? List<int>.from(json['toothNumbers'])
        : <int>[];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['compensationType'] = compensationType;
    data['toothNumbers'] = toothNumbers;

    return data;
  }
}
