import 'lab_feed_ad_model.dart';

class LabFeedAdsResponse {
  final int count;
  final List<LabFeedAdModel> data;

  const LabFeedAdsResponse({
    required this.count,
    required this.data,
  });

  factory LabFeedAdsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    final rawData =
        json['data'];

    return LabFeedAdsResponse(
      count: json['count'] is int
          ? json['count']
          : int.tryParse(
                json['count']
                        ?.toString() ??
                    '',
              ) ??
              0,
      data: rawData is List
          ? rawData
              .whereType<
                  Map<String, dynamic>>()
              .map(
                LabFeedAdModel.fromJson,
              )
              .toList()
          : const [],
    );
  }
}