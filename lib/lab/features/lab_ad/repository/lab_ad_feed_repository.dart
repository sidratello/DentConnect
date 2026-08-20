import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';

import '../model/lab_feed_ads_response.dart';

class LabAdFeedRepository {
  final ApiService _apiService;

  LabAdFeedRepository({
    ApiService? apiService,
  }) : _apiService =
            apiService ??
            ApiService();

  Future<
      ApiResponse<
          LabFeedAdsResponse>>
      getAdvertisements() async {
    final response =
        await _apiService.get<
            Map<String, dynamic>>(
      'lab-advertisements',
    );

    if (!response.success ||
        response.data == null) {
      return ApiResponse.error(
        response.message,
        statusCode:
            response.statusCode,
      );
    }

    try {
      final result =
          LabFeedAdsResponse.fromJson(
        response.data!,
      );

      return ApiResponse.success(
        data: result,
        message: response.message,
        statusCode:
            response.statusCode,
      );
    } catch (_) {
      return ApiResponse.error(
        'تعذر قراءة بيانات الإعلانات.',
        statusCode:
            response.statusCode,
      );
    }
  }
}