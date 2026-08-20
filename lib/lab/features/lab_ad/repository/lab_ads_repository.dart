import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';

import '../model/lab_ads_response.dart';

class LabAdsRepository {
  final ApiService _apiService;

  LabAdsRepository({
    ApiService? apiService,
  }) : _apiService =
            apiService ?? ApiService();

  Future<ApiResponse<LabAdsResponse>>
      getPendingPaymentAds() {
    return _getAds(
      'lab-ad/pending-payment',
    );
  }

  Future<ApiResponse<LabAdsResponse>>
      getActiveAds() {
    return _getAds(
      'lab-ad/active',
    );
  }

  Future<ApiResponse<LabAdsResponse>>
      _getAds(
    String path,
  ) async {
    final response =
        await _apiService.get<
            Map<String, dynamic>>(
      path,
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
          LabAdsResponse.fromJson(
      
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