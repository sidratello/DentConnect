import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';

class LabHomeRepo {
  final ApiService _apiService = ApiService();

  Future<ApiResponse<int>> getConnectionRequestsCount() async {
    final response = await _apiService.get<Map<String, dynamic>>(
      'ConnectionForLab/requests/count',
    );

    if (response.success && response.data != null) {
      return ApiResponse.success(
        data: response.data!['count'] ?? 0,
        message: response.message,
        statusCode: response.statusCode,
      );
    }

    return ApiResponse.error(
      response.message,
      statusCode: response.statusCode,
    );
  }


 Future<ApiResponse<int>> getPendingOrdersCount() async {
    final response = await _apiService.get<Map<String, dynamic>>(
      'LabOrders/pending/count',
    );

    if (response.success && response.data != null) {
      return ApiResponse.success(
        data: response.data!['pendingCount'] ?? 0,
        message: response.message,
        statusCode: response.statusCode,
      );
    }

    return ApiResponse.error(
      response.message,
      statusCode: response.statusCode,
    );
  }


}