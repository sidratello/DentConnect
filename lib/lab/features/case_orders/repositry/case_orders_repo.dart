import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';
import 'package:template/lab/shared/models/lab_order_model.dart';

class CaseOrdersRepo {
  final ApiService _apiService = ApiService();

  Future<ApiResponse<List<LabOrderModel>>> getOrdersByStatus(
    String status,
  ) async {
    final response = await _apiService.get<List<dynamic>>(
      'lab-order-status/by-status/$status',
    );

    if (response.success && response.data != null) {
      final items = response.data!
        .map((e) => LabOrderModel.fromJson(e))
          .toList();

      return ApiResponse.success(
        data: items,
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