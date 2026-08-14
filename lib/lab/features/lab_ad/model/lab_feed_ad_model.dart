class LabFeedAdModel {
  final int id;
  final String content;
  final DateTime? createdAt;
  final DateTime? expiresAt;
  final List<String> images;

  const LabFeedAdModel({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.expiresAt,
    required this.images,
  });

  factory LabFeedAdModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return LabFeedAdModel(
      id: _parseInt(
        json['id'],
      ),
      content:
          json['content']
                  ?.toString()
                  .trim() ??
              '',
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
          (item) =>
              item.toString(),
        )
        .where(
          (item) =>
              item.trim().isNotEmpty,
        )
        .toList();
  }
}