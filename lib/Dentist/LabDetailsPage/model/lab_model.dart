class LabModel {
  int? id;
  String? labName;
  String? description;
  int? yearsOfExperience;
  String? availability;
  List? materials;
  List? specialties;
  double? averageRating;
  List<Prices>? prices;
  List<String>? galleryImages;

  List<String>? mainImage;
  bool? hasScan;
  String? connectionStatus;

  LabModel({
    this.id,
    this.labName,
    this.description,
    this.yearsOfExperience,
    this.availability,
    this.materials,
    this.specialties,
    this.averageRating,
    this.prices,
    this.galleryImages,
    this.mainImage,
    this.hasScan,
    this.connectionStatus,
  });

  LabModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    labName = json['labName'] ?? json['name'] ?? '';
    description = json['description'];
    yearsOfExperience = json['yearsOfExperience'];
    availability = json['availability'];
    materials = json['materials'] ?? [];
    specialties = json['specialties'] ?? [];
    averageRating = json['averageRating'] ?? 0.0;
    mainImage = json['profilePicturesUrl'] ?? [];
    hasScan = json['hasScanVisitService'] ?? false;
    connectionStatus = json['connectionStatus'] ?? 'NotConnected';
    if (json['prices'] != null) {
      prices = <Prices>[];
      json['prices'].forEach((v) {
        prices!.add(Prices.fromJson(v));
      });
    }

    // if (json['galleryImages'] != null) {
    //   galleryImages = <Null>[];
    //   json['galleryImages'].forEach((v) {
    //     galleryImages!.add(new Null.fromJson(v));
    //   });
    // }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['labName'] = this.labName;
  //   data['description'] = this.description;
  //   data['yearsOfExperience'] = this.yearsOfExperience;
  //   data['availability'] = this.availability;
  //   data['materials'] = this.materials;
  //   data['specialties'] = this.specialties;
  //   data['averageRating'] = this.averageRating;
  //   if (this.prices != null) {
  //     data['prices'] = this.prices!.map((v) => v.toJson()).toList();
  //   }
  //   // if (this.galleryImages != null) {
  //   //   data['galleryImages'] =
  //   //       this.galleryImages!.map((v) => v.toJson()).toList();
  //   // }
  //   return data;
  // }
}

class Prices {
  String? type;
  int? price;
  String? notes;

  Prices({this.type, this.price, this.notes});

  Prices.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    price = json['price'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['price'] = this.price;
    data['notes'] = this.notes;
    return data;
  }
}
