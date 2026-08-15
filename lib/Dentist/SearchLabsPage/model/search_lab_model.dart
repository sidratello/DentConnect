class SearchLabModel {
  int? count;
  bool? isUserLoggedIn;
  List<Labs>? labs;

  SearchLabModel({this.count, this.isUserLoggedIn, this.labs});

  SearchLabModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    isUserLoggedIn = json['isUserLoggedIn'];
    if (json['labs'] != null) {
      labs = <Labs>[];
      json['labs'].forEach((v) {
        labs!.add(Labs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['isUserLoggedIn'] = isUserLoggedIn;
    if (labs != null) {
      data['labs'] = labs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Labs {
  int? labId;
  int? ownerId;
  String? labName;
  String? placeName;
  String? email;
  String? phone;
  String? city;
  String? country;
  String? profilePictureUrl;
  int? yearsOfExperience;
  List<String>? specialties;
  List<String>? materials;
  double? averageRating;
  bool? hasScanVisitService;
  bool? isVisitor;
  String? availabilityStatus;
  bool? isAccountActive;
  bool? isOnlineAvailable;
  bool? isConnectedWithCurrentDoctor;

  Labs(
      {this.labId,
      this.ownerId,
      this.labName,
      this.placeName,
      this.email,
      this.phone,
      this.city,
      this.country,
      this.profilePictureUrl,
      this.yearsOfExperience,
      this.specialties,
      this.materials,
      this.averageRating,
      this.hasScanVisitService,
      this.isVisitor,
      this.availabilityStatus,
      this.isAccountActive,
      this.isOnlineAvailable,
      this.isConnectedWithCurrentDoctor});

  Labs.fromJson(Map<String, dynamic> json) {
    labId = json['labId'];
    ownerId = json['ownerId'];
    labName = json['labName'];
    placeName = json['placeName'];
    email = json['email'];
    phone = json['phone'];
    city = json['city'];
    country = json['country'];
    profilePictureUrl = json['profilePictureUrl'];
    yearsOfExperience = json['yearsOfExperience'];
    specialties = json['specialties'].cast<String>();
    materials = json['materials'].cast<String>();
    averageRating = json['averageRating'];
    hasScanVisitService = json['hasScanVisitService'];
    isVisitor = json['isVisitor'];
    availabilityStatus = json['availabilityStatus'];
    isAccountActive = json['isAccountActive'];
    isOnlineAvailable = json['isOnlineAvailable'];
    isConnectedWithCurrentDoctor = json['isConnectedWithCurrentDoctor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['labId'] = labId;
    data['ownerId'] = ownerId;
    data['labName'] = labName;
    data['placeName'] = placeName;
    data['email'] = email;
    data['phone'] = phone;
    data['city'] = city;
    data['country'] = country;
    data['profilePictureUrl'] = profilePictureUrl;
    data['yearsOfExperience'] = yearsOfExperience;
    data['specialties'] = specialties;
    data['materials'] = materials;
    data['averageRating'] = averageRating;
    data['hasScanVisitService'] = hasScanVisitService;
    data['isVisitor'] = isVisitor;
    data['availabilityStatus'] = availabilityStatus;
    data['isAccountActive'] = isAccountActive;
    data['isOnlineAvailable'] = isOnlineAvailable;
    data['isConnectedWithCurrentDoctor'] = isConnectedWithCurrentDoctor;
    return data;
  }
}
