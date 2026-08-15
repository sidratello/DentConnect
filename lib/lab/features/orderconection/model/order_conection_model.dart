/// =============================
/// order_connection_model.dart
/// =============================

class OrderConnectionModel {
  final int id;
  final String status;
  final DateTime createdAt;
  final DentistModel dentist;

  OrderConnectionModel({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.dentist,
  });

  factory OrderConnectionModel.fromJson(Map<String, dynamic> json) {
    return OrderConnectionModel(
      id: json['id'] ?? 0,
      status: json['status'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      dentist: DentistModel.fromJson(json['dentist'] ?? {}),
    );
  }
}

class DentistModel {
  final int id;
  final String name;
  final String phone;
  final String namePlace;
  final String addressPlace;
  final String cityPlace;
  final String countryPlace;

  DentistModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.namePlace,
    required this.addressPlace,
    required this.cityPlace,
    required this.countryPlace,
  });

  factory DentistModel.fromJson(Map<String, dynamic> json) {
    return DentistModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      namePlace: json['namePlace'] ?? '',
      addressPlace: json['addressPlace'] ?? '',
      cityPlace: json['cityPlace'] ?? '',
      countryPlace: json['countryPlace'] ?? '',
    );
  }
}