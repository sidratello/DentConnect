class InvoiceModel {
  int? id;
  String? title;
  String? status;
  double? finalPrice;
  bool? isPaid;
  String? paidAt;
  String? createdAt;

  String? dentistName;
  String? dentistEmail;
  String? dentistPhone;

  String? clinicName;
  String? addressPlace;
  String? cityPlace;
  String? countryPlace;

  String? labName;
  List<String>? items;

  InvoiceModel({
    this.id,
    this.title,
    this.status,
    this.finalPrice,
    this.isPaid,
    this.paidAt,
    this.createdAt,
    this.dentistName,
    this.dentistEmail,
    this.dentistPhone,
    this.clinicName,
    this.addressPlace,
    this.cityPlace,
    this.countryPlace,
    this.labName,
    this.items,
  });

  factory InvoiceModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return InvoiceModel(
      id: json['id'],
      title: json['title'],
      status: json['status'],
      finalPrice: _toDouble(json['finalPrice']),
      isPaid: json['isPaid'],
      paidAt: json['paidAt'],
      createdAt: json['createdAt'],
      dentistName: json['dentistName'],
      dentistEmail: json['dentistEmail'],
      dentistPhone: json['dentistPhone'],
      clinicName: json['clinicName'],
      addressPlace: json['addressPlace'],
      cityPlace: json['cityPlace'],
      countryPlace: json['countryPlace'],
      labName: json['labName'],
      items: json['items'] != null ? List<String>.from(json['items']) : [],
    );
  }

  static double? _toDouble(dynamic value) {
    if (value == null) {
      return null;
    }

    if (value is num) {
      return value.toDouble();
    }

    return double.tryParse(
      value.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'status': status,
      'finalPrice': finalPrice,
      'isPaid': isPaid,
      'paidAt': paidAt,
      'createdAt': createdAt,
      'dentistName': dentistName,
      'dentistEmail': dentistEmail,
      'dentistPhone': dentistPhone,
      'clinicName': clinicName,
      'addressPlace': addressPlace,
      'cityPlace': cityPlace,
      'countryPlace': countryPlace,
      'labName': labName,
      'items': items,
    };
  }
}
