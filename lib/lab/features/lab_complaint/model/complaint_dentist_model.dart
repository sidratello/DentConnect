class ComplaintDentistModel {
  final int id;

  final String name;
  final String email;
  final String phone;

  final String clinicName;
  final String clinicAddress;

  final String city;
  final String country;

  final String? profilePictureUrl;

  const ComplaintDentistModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.clinicName,
    required this.clinicAddress,
    required this.city,
    required this.country,
    required this.profilePictureUrl,
  });

  factory ComplaintDentistModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ComplaintDentistModel(
      id:
          (json['id'] as num?)?.toInt() ??
              0,

      name:
          json['name']?.toString().trim() ??
              '',

      email:
          json['email']?.toString().trim() ??
              '',

      phone:
          json['phone']?.toString().trim() ??
              '',

      clinicName:
          json['clinicName']
                  ?.toString()
                  .trim() ??
              '',

      clinicAddress:
          json['clinicAddress']
                  ?.toString()
                  .trim() ??
              '',

      city:
          json['city']?.toString().trim() ??
              '',

      country:
          json['country']
                  ?.toString()
                  .trim() ??
              '',

      profilePictureUrl:
          json['profilePictureUrl']
              ?.toString()
              .trim(),
    );
  }
}