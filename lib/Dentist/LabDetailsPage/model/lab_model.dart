class LabModel {
  int? id;
  String? name;
  String? profilePictureUrl;
  bool? isConnected;
  double? averageRating;
  int? ratingsCount;
  String? phone;
  String? addressPlace;
  String? cityPlace;
  String? countryPlace;

  LabModel(
      {this.id,
      this.name,
      this.profilePictureUrl,
      this.isConnected,
      this.averageRating,
      this.ratingsCount,
      this.phone,
      this.addressPlace,
      this.cityPlace,
      this.countryPlace});

  LabModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? json['labName'] ?? '';
    profilePictureUrl = json['profilePictureUrl'] ?? '';
    isConnected = json['isConnected'] ?? false;
    averageRating = json['averageRating'] ?? 0.0;
    ratingsCount = json['ratingsCount'] ?? 0.0;
    phone = json['phone'] ?? '';
    addressPlace = json['addressPlace'] ?? '';
    cityPlace = json['cityPlace'] ?? '';
    countryPlace = json['countryPlace'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['profilePictureUrl'] = profilePictureUrl;
    data['isConnected'] = isConnected;
    data['averageRating'] = averageRating;
    data['ratingsCount'] = ratingsCount;
    data['phone'] = phone;
    data['addressPlace'] = addressPlace;
    data['cityPlace'] = cityPlace;
    data['countryPlace'] = countryPlace;
    return data;
  }
}

// class LabModel {
//   int? id;
//   String? labName;
//   String? description;
//   int? yearsOfExperience;
//   String? availability;
//   List? materials;
//   List? specialties;
//   double? averageRating;
//   List<Prices>? prices;
//   List<String>? galleryImages;

//   List<String>? mainImage;
//   bool? hasScan;
//   String? connectionStatus;
//   String? phone = 'testing phone number';
//   String? address = 'testing address';

//   LabModel({
//     this.id,
//     this.labName,
//     this.description,
//     this.yearsOfExperience,
//     this.availability,
//     this.materials,
//     this.specialties,
//     this.averageRating,
//     this.prices,
//     this.galleryImages,
//     this.mainImage,
//     this.hasScan,
//     this.connectionStatus,
//   });

//   LabModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'] ?? '';
//     labName = json['labName'] ?? json['name'] ?? '';
//     description = json['description'];
//     yearsOfExperience = json['yearsOfExperience'];
//     availability = json['availability'];
//     materials = json['materials'] ?? [];
//     specialties = json['specialties'] ?? [];
//     averageRating = json['averageRating'] ?? 0.0;
//     mainImage = json['profilePicturesUrl'] ?? [];
//     hasScan = json['hasScanVisitService'] ?? false;
//     connectionStatus = json['connectionStatus'] ?? 'NotConnected';
//     if (json['prices'] != null) {
//       prices = <Prices>[];
//       json['prices'].forEach((v) {
//         prices!.add(Prices.fromJson(v));
//       });
//     }

//     // if (json['galleryImages'] != null) {
//     //   galleryImages = <Null>[];
//     //   json['galleryImages'].forEach((v) {
//     //     galleryImages!.add(new Null.fromJson(v));
//     //   });
//     // }
//   }

//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['id'] = this.id;
//   //   data['labName'] = this.labName;
//   //   data['description'] = this.description;
//   //   data['yearsOfExperience'] = this.yearsOfExperience;
//   //   data['availability'] = this.availability;
//   //   data['materials'] = this.materials;
//   //   data['specialties'] = this.specialties;
//   //   data['averageRating'] = this.averageRating;
//   //   if (this.prices != null) {
//   //     data['prices'] = this.prices!.map((v) => v.toJson()).toList();
//   //   }
//   //   // if (this.galleryImages != null) {
//   //   //   data['galleryImages'] =
//   //   //       this.galleryImages!.map((v) => v.toJson()).toList();
//   //   // }
//   //   return data;
//   // }
// }

// class Prices {
//   String? type;
//   int? price;
//   String? notes;

//   Prices({this.type, this.price, this.notes});

//   Prices.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     price = json['price'];
//     notes = json['notes'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['type'] = this.type;
//     data['price'] = this.price;
//     data['notes'] = this.notes;
//     return data;
//   }
// }
