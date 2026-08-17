class DoctorProfileModel {
  int? dentistId;
  String? email;
  String? phone;
  String? cityPlace;
  String? profilePictureUrl;

  DoctorProfileModel(
      {this.dentistId,
      this.email,
      this.phone,
      this.cityPlace,
      this.profilePictureUrl});

  DoctorProfileModel.fromJson(Map<String, dynamic> json) {
    dentistId = json['dentistId'];
    email = json['email'];
    phone = json['phone'];
    cityPlace = json['cityPlace'];
    profilePictureUrl = json['profilePictureUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dentistId'] = dentistId;
    data['email'] = email;
    data['phone'] = phone;
    data['cityPlace'] = cityPlace;
    data['profilePictureUrl'] = profilePictureUrl;
    return data;
  }
}
