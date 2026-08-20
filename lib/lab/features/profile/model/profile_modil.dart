class LabProfileModel {
  final String description;
  final int yearsOfExperience;
  final List<String> specialties;
  final List<String> materials;
  final String availability;
  final bool hasScanVisitService;
  final double averageRating;
  final List<LabPriceModel> prices;
  final LabOwner owner;
final List<LabGalleryModel> gallery;
  LabProfileModel({
    required this.description,
    required this.yearsOfExperience,
    required this.specialties,
    required this.materials,
    required this.availability,
    required this.hasScanVisitService,
    required this.averageRating,
    required this.prices,
    required this.owner,
    required this.gallery,
  });

  factory LabProfileModel.fromJson(Map<String, dynamic> json) {
    return LabProfileModel(
      description: json['description'] ?? '',
      yearsOfExperience: json['yearsOfExperience'] ?? 0,
      specialties: List<String>.from(json['specialties'] ?? []),
      materials: List<String>.from(json['materials'] ?? []),
      availability: json['availability'] ?? '',
      hasScanVisitService: json['hasScanVisitService'] ?? false,
      averageRating: (json['averageRating'] ?? 0).toDouble(),

      prices: (json['prices'] as List? ?? [])
          .map((e) => LabPriceModel.fromJson(e))
          .toList(),

      owner: LabOwner.fromJson(json['owner'] ?? {}),
      gallery: (json['gallery'] as List? ?? [])
    .map((e) => LabGalleryModel.fromJson(e))
    .toList(),
    );
  }
}

class LabPriceModel {
  final int id;
  final String compensationType;
  final num unitPrice;
  final String notes;
  final String updatedAt;

  LabPriceModel({
    required this.id,
    required this.compensationType,
    required this.unitPrice,
    required this.notes,
    required this.updatedAt,
  });

  factory LabPriceModel.fromJson(Map<String, dynamic> json) {
    return LabPriceModel(
      id: json['id'] ?? 0,
      compensationType: json['compensationType'] ?? '',
      unitPrice: json['unitPrice'] ?? 0,
      notes: json['notes'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}

class LabOwner {
  final String name;
  final String email;
  final String phone;
  final String namePlace;
  final String addressPlace;
  final String cityPlace;
  final String countryPlace;

  LabOwner({
    required this.name,
    required this.email,
    required this.phone,
    required this.namePlace,
    required this.addressPlace,
    required this.cityPlace,
    required this.countryPlace,
  });

  factory LabOwner.fromJson(Map<String, dynamic> json) {
    return LabOwner(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      namePlace: json['namePlace'] ?? '',
      addressPlace: json['addressPlace'] ?? '',
      cityPlace: json['cityPlace'] ?? '',
      countryPlace: json['countryPlace'] ?? '',
    );
  }
}
class LabGalleryModel {
  final int id;
  final String path;
  final String type;
  final String uploadedAt;

  LabGalleryModel({
    required this.id,
    required this.path,
    required this.type,
    required this.uploadedAt,
  });

  factory LabGalleryModel.fromJson(Map<String, dynamic> json) {
    return LabGalleryModel(
      id: json['id'] ?? 0,
      path: json['path'] ?? '',
      type: json['type'] ?? '',
      uploadedAt: json['uploadedAt'] ?? '',
    );
  }
}