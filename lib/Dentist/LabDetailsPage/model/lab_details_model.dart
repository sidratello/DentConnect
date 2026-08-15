class LabDetailsModel {
  int? id;
  String? labName;
  String? description;
  int? yearsOfExperience;
  String? availability;
  String? address;
  String? city;
  String? country;
  String? phone;
  String? profilePictureUrl;
  bool? hasScanVisitService;
  String? connectionStatus;
  bool? isConnected;
  List<String>? materials;
  List<String>? specialties;
  RatingSummary? ratingSummary;
  List<String>? reviews;
  List<Prices>? prices;
  List<String>? galleryImages;

  LabDetailsModel(
      {this.id,
      this.labName,
      this.description,
      this.yearsOfExperience,
      this.availability,
      this.address,
      this.city,
      this.country,
      this.phone,
      this.profilePictureUrl,
      this.hasScanVisitService,
      this.connectionStatus,
      this.isConnected,
      this.materials,
      this.specialties,
      this.ratingSummary,
      this.reviews,
      this.prices,
      this.galleryImages});

  LabDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    labName = json['labName'];
    description = json['description'];
    yearsOfExperience = json['yearsOfExperience'];
    availability = json['availability'];
    address = json['address'];
    city = json['city'];
    country = json['country'];
    phone = json['phone'];
    profilePictureUrl = json['profilePictureUrl'];
    hasScanVisitService = json['hasScanVisitService'];
    connectionStatus = json['connectionStatus'];
    isConnected = json['isConnected'];
    materials = json['materials'].cast<String>();
    specialties = json['specialties'].cast<String>();
    ratingSummary = json['ratingSummary'] != null
        ? RatingSummary.fromJson(json['ratingSummary'])
        : null;
    if (json['reviews'] != null) {
      reviews = <String>[];
      json['reviews'].forEach((v) {
        reviews!.add(v);
      });
    }
    if (json['prices'] != null) {
      prices = <Prices>[];
      json['prices'].forEach((v) {
        prices!.add(Prices.fromJson(v));
      });
    }
    if (json['galleryImages'] != null) {
      galleryImages = <String>[];
      json['galleryImages'].forEach((v) {
        galleryImages!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['labName'] = labName;
    data['description'] = description;
    data['yearsOfExperience'] = yearsOfExperience;
    data['availability'] = availability;
    data['address'] = address;
    data['city'] = city;
    data['country'] = country;
    data['phone'] = phone;
    data['profilePictureUrl'] = profilePictureUrl;
    data['hasScanVisitService'] = hasScanVisitService;
    data['connectionStatus'] = connectionStatus;
    data['isConnected'] = isConnected;
    data['materials'] = materials;
    data['specialties'] = specialties;
    if (ratingSummary != null) {
      data['ratingSummary'] = ratingSummary!.toJson();
    }
    if (reviews != null) {
      data['reviews'] = reviews;
    }
    if (prices != null) {
      data['prices'] = prices!.map((v) => v.toJson()).toList();
    }
    if (galleryImages != null) {
      data['galleryImages'] = galleryImages;
    }
    return data;
  }
}

class RatingSummary {
  double? averageOverall;
  double? averageQuality;
  double? averageTimeCommitment;
  int? totalReviews;

  RatingSummary(
      {this.averageOverall,
      this.averageQuality,
      this.averageTimeCommitment,
      this.totalReviews});

  RatingSummary.fromJson(Map<String, dynamic> json) {
    averageOverall = json['averageOverall'];
    averageQuality = json['averageQuality'];
    averageTimeCommitment = json['averageTimeCommitment'];
    totalReviews = json['totalReviews'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['averageOverall'] = averageOverall;
    data['averageQuality'] = averageQuality;
    data['averageTimeCommitment'] = averageTimeCommitment;
    data['totalReviews'] = totalReviews;
    return data;
  }
}

class Prices {
  String? type;
  double? price;
  String? notes;

  Prices({this.type, this.price, this.notes});

  Prices.fromJson(Map<String, dynamic> json) {
    type = json['type'] ?? '';
    price = json['price'] ?? 0;
    notes = json['notes'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['price'] = price;
    data['notes'] = notes;
    return data;
  }
}
