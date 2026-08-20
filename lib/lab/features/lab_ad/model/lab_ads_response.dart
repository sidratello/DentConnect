import 'lab_ad_model.dart';

class LabAdsResponse {
  final int count;
  final List<LabAdModel> data;

  const LabAdsResponse({
    required this.count,
    required this.data,
  });

  factory LabAdsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    final rawData = json['data'];

    final ads = rawData is List
        ? rawData
            .whereType<Map>()
            .map(
              (item) =>
                  LabAdModel.fromJson(
                Map<String, dynamic>.from(
                  item,
                ),
              ),
            )
            .toList()
        : <LabAdModel>[];

    return LabAdsResponse(
      count: json['count'] is int
          ? json['count']
          : ads.length,
      data: ads,
    );
  }
}