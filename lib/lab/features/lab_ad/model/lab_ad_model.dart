class LabAdModel {
  final int id;
  final String content;
  final double price;
  final bool isActive;
  final bool isPaid;
  final DateTime? createdAt;
  final DateTime? expiresAt;
  final List<String> images;

  const LabAdModel({
    required this.id,
    required this.content,
    required this.price,
    required this.isActive,
    required this.isPaid,
    required this.createdAt,
    required this.expiresAt,
    required this.images,
  });

  factory LabAdModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return LabAdModel(
      id: _parseInt(json['id']),
      content: json['content']
              ?.toString()
              .trim() ??
          '',
      price: _parseDouble(
        json['price'],
      ),
      isActive:
          json['isActive'] == true,
      isPaid: json['isPaid'] == true,
      createdAt: _parseDate(
        json['createdAt'],
      ),
      expiresAt: _parseDate(
        json['expiresAt'],
      ),
      images: _parseImages(
        json['images'],
      ),
    );
  }

  static int _parseInt(
    dynamic value,
  ) {
    if (value is int) {
      return value;
    }

    return int.tryParse(
          value?.toString() ?? '',
        ) ??
        0;
  }

  static double _parseDouble(
    dynamic value,
  ) {
    if (value is num) {
      return value.toDouble();
    }

    return double.tryParse(
          value?.toString() ?? '',
        ) ??
        0;
  }

  static DateTime? _parseDate(
    dynamic value,
  ) {
    if (value == null) {
      return null;
    }

    return DateTime.tryParse(
      value.toString(),
    );
  }

  static List<String> _parseImages(
    dynamic value,
  ) {
    if (value is! List) {
      return const [];
    }

    return value
        .map(
          (image) =>
              image.toString(),
        )
        .where(
          (image) =>
              image.trim().isNotEmpty,
        )
        .toList();
  }
}