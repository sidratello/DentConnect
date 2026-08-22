class DoctorProfileModel {
  int? dentistId;
  String? email;
  String? phone;
  String? cityPlace;
  String? name;
  String? profilePictureUrl;

  DoctorProfileModel(
      {this.dentistId,
      this.name,
      this.email,
      this.phone,
      this.cityPlace,
      this.profilePictureUrl});

  DoctorProfileModel.fromJson(Map<String, dynamic> json) {
    dentistId = json['dentistId'];
    email = json['email'];
    phone = json['phone'];
    name = json['name'];
    cityPlace = json['cityPlace'];
    profilePictureUrl = json['profilePictureUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dentistId'] = dentistId;
    data['email'] = email;
    data['name'] = name;
    data['phone'] = phone;
    data['cityPlace'] = cityPlace;
    data['profilePictureUrl'] = profilePictureUrl;
    return data;
  }
}
