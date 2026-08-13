class AdvertisementModel {
  final int id;
  final String title;
  final String content;
  final int userId;
  final bool isActive;
  final bool isPaid;
  final DateTime? createdAt;
  final DateTime? expiresAt;
  final List<String> images;

  const AdvertisementModel({
    required this.id,
    required this.title,
    required this.content,
    required this.userId,
    required this.isActive,
    required this.isPaid,
    required this.createdAt,
    required this.expiresAt,
    required this.images,
  });

  factory AdvertisementModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return AdvertisementModel(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(
                json['id']?.toString() ??
                    '',
              ) ??
              0,
      title:
          json['title']?.toString() ?? '',
      content:
          json['content']?.toString() ??
              '',
      userId: json['userId'] is int
          ? json['userId']
          : int.tryParse(
                json['userId']
                        ?.toString() ??
                    '',
              ) ??
              0,
      isActive:
          json['isActive'] == true,
      isPaid: json['isPaid'] == true,
      createdAt: DateTime.tryParse(
        json['createdAt']?.toString() ??
            '',
      ),
      expiresAt: DateTime.tryParse(
        json['expiresAt']?.toString() ??
            '',
      ),
      images: json['images'] is List
          ? List<String>.from(
              (json['images'] as List)
                  .map(
                (image) =>
                    image.toString(),
              ),
            )
          : const [],
    );
  }
}