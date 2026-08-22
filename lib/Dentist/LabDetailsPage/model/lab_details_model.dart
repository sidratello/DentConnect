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
  List<GalleryImage>? galleryImages;

  LabDetailsModel({
    this.id,
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
    this.galleryImages,
  });

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

    // Materials
    if (json['materials'] != null && json['materials'] is List) {
      materials = List<String>.from(
        json['materials'],
      );
    }

    // Specialties
    if (json['specialties'] != null && json['specialties'] is List) {
      specialties = List<String>.from(
        json['specialties'],
      );
    }

    // Rating Summary
    if (json['ratingSummary'] != null) {
      ratingSummary = RatingSummary.fromJson(
        json['ratingSummary'] as Map<String, dynamic>,
      );
    }

    // Reviews
    // if (json['reviews'] != null && json['reviews'] is List) {
    //   reviews = List<String>.from(
    //     json['reviews'],
    //   );
    // }

    // Prices
    if (json['prices'] != null && json['prices'] is List) {
      prices = (json['prices'] as List)
          .map(
            (item) => Prices.fromJson(
              item as Map<String, dynamic>,
            ),
          )
          .toList();
    }

    // Gallery Images
    if (json['galleryImages'] != null && json['galleryImages'] is List) {
      galleryImages = (json['galleryImages'] as List)
          .map(
            (item) => GalleryImage.fromJson(
              item as Map<String, dynamic>,
            ),
          )
          .toList();
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
      data['prices'] = prices!
          .map(
            (price) => price.toJson(),
          )
          .toList();
    }

    if (galleryImages != null) {
      data['galleryImages'] = galleryImages!
          .map(
            (image) => image.toJson(),
          )
          .toList();
    }

    return data;
  }
}

class GalleryImage {
  String? url;
  String? name;

  GalleryImage({
    this.url,
    this.name,
  });

  GalleryImage.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'name': name,
    };
  }
}

class RatingSummary {
  double? averageOverall;
  double? averageQuality;
  double? averageTimeCommitment;
  int? totalReviews;

  RatingSummary({
    this.averageOverall,
    this.averageQuality,
    this.averageTimeCommitment,
    this.totalReviews,
  });

  RatingSummary.fromJson(Map<String, dynamic> json) {
    averageOverall = _toDouble(
      json['averageOverall'],
    );

    averageQuality = _toDouble(
      json['averageQuality'],
    );

    averageTimeCommitment = _toDouble(
      json['averageTimeCommitment'],
    );

    totalReviews = json['totalReviews'];
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
      'averageOverall': averageOverall,
      'averageQuality': averageQuality,
      'averageTimeCommitment': averageTimeCommitment,
      'totalReviews': totalReviews,
    };
  }
}

class Prices {
  String? type;
  double? price;
  String? notes;

  Prices({
    this.type,
    this.price,
    this.notes,
  });

  Prices.fromJson(Map<String, dynamic> json) {
    type = json['type'] ?? '';

    price = json['price'] != null ? _toDouble(json['price']) : 0;

    notes = json['notes'] ?? '';
  }

  static double _toDouble(dynamic value) {
    if (value is num) {
      return value.toDouble();
    }

    return double.tryParse(
          value.toString(),
        ) ??
        0;
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'price': price,
      'notes': notes,
    };
  }
}
