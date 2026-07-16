class ConnectedDoctorModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String clinicName;
  final String clinicAddress;
  final String city;
  final String country;

  const ConnectedDoctorModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.clinicName,
    required this.clinicAddress,
    required this.city,
    required this.country,
  });

  factory ConnectedDoctorModel.fromJson(Map<String, dynamic> json) {
    return ConnectedDoctorModel(
      id: json['id'] ?? 0,
      name: json['name']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      clinicName: json['clinicName']?.toString() ?? '',
      clinicAddress: json['clinicAddress']?.toString() ?? '',
      city: json['city']?.toString() ?? '',
      country: json['country']?.toString() ?? '',
    );
  }

  String get fullAddress {
    final parts = [
      country,
      city,
      clinicAddress,
    ].where((value) => value.trim().isNotEmpty).toList();

    return parts.isEmpty ? '-' : parts.join(' - ');
  }
}