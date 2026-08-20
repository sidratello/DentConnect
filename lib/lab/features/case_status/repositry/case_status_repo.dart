import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';
import '../model/case_status_model.dart';

class CaseStatusRepo {
  final ApiService _apiService = ApiService();

  Future<ApiResponse<List<String>>> getAllStatuses() async {
    final response = await _apiService.get<List<dynamic>>(
      'Enums/case-status',
    );

    if (response.success && response.data != null) {
      return ApiResponse.success(
        data: response.data!.map((e) => e.toString()).toList(),
        message: response.message,
        statusCode: response.statusCode,
      );
    }

    return ApiResponse.error(response.message);
  }

  Future<ApiResponse<List<CaseStatusCountModel>>> getStatusCounts() async {
    final response = await _apiService.get<List<dynamic>>(
      'lab-order-status/counts',
    );

    if (response.success && response.data != null) {
      return ApiResponse.success(
        data: response.data!
            .map((e) => CaseStatusCountModel.fromJson(e))
            .toList(),
        message: response.message,
        statusCode: response.statusCode,
      );
    }

    return ApiResponse.error(response.message);
  }
}