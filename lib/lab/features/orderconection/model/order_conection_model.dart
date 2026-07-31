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

  factory OrderConnectionModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return OrderConnectionModel(
      id: json['id'] ?? 0,
      status: json['status']?.toString() ?? '',
      createdAt:
          DateTime.tryParse(
            json['createdAt']?.toString() ?? '',
          ) ??
          DateTime.now(),
      dentist: DentistModel.fromJson(
        json['dentist'] is Map<String, dynamic>
            ? json['dentist']
            : <String, dynamic>{},
      ),
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
  final String profilePictureUrl;

  const DentistModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.namePlace,
    required this.addressPlace,
    required this.cityPlace,
    required this.countryPlace,
    required this.profilePictureUrl,
  });

  factory DentistModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return DentistModel(
      id: json['id'] ?? 0,
      name: json['name']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      namePlace: json['namePlace']?.toString() ?? '',
      addressPlace:
          json['addressPlace']?.toString() ?? '',
      cityPlace: json['cityPlace']?.toString() ?? '',
      countryPlace:
          json['countryPlace']?.toString() ?? '',
      profilePictureUrl:
          json['profilePictureUrl']?.toString() ?? '',
    );
  }
}