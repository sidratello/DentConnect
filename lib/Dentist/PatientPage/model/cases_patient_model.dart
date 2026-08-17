class CasesPatientModel {
  bool? success;
  String? message;
  List<Data>? data;

  CasesPatientModel({this.success, this.message, this.data});

  CasesPatientModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? status;
  String? impressionStage;
  String? impressionType;
  String? shade;
  bool? isUrgent;
  bool? isTemporary;
  String? deliveryDate;
  double? estimatedPrice;
  double? finalPrice;
  bool? isPaid;
  String? paidAt;
  String? createdAt;
  int? patientId;
  String? patientName;
  int? createdById;
  String? dentistName;
  int? assignedLabId;
  String? labName;

  Data(
      {this.id,
      this.title,
      this.status,
      this.impressionStage,
      this.impressionType,
      this.shade,
      this.isUrgent,
      this.isTemporary,
      this.deliveryDate,
      this.estimatedPrice,
      this.finalPrice,
      this.isPaid,
      this.paidAt,
      this.createdAt,
      this.patientId,
      this.patientName,
      this.createdById,
      this.dentistName,
      this.assignedLabId,
      this.labName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    impressionStage = json['impressionStage'];
    impressionType = json['impressionType'];
    shade = json['shade'];
    isUrgent = json['isUrgent'];
    isTemporary = json['isTemporary'];
    deliveryDate = json['deliveryDate'];
    estimatedPrice = json['estimatedPrice'];
    finalPrice = json['finalPrice'];
    isPaid = json['isPaid'];
    paidAt = json['paidAt'];
    createdAt = json['createdAt'];
    patientId = json['patientId'];
    patientName = json['patientName'];
    createdById = json['createdById'];
    dentistName = json['dentistName'];
    assignedLabId = json['assignedLabId'];
    labName = json['labName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['status'] = status;
    data['impressionStage'] = impressionStage;
    data['impressionType'] = impressionType;
    data['shade'] = shade;
    data['isUrgent'] = isUrgent;
    data['isTemporary'] = isTemporary;
    data['deliveryDate'] = deliveryDate;
    data['estimatedPrice'] = estimatedPrice;
    data['finalPrice'] = finalPrice;
    data['isPaid'] = isPaid;
    data['paidAt'] = paidAt;
    data['createdAt'] = createdAt;
    data['patientId'] = patientId;
    data['patientName'] = patientName;
    data['createdById'] = createdById;
    data['dentistName'] = dentistName;
    data['assignedLabId'] = assignedLabId;
    data['labName'] = labName;
    return data;
  }
}
