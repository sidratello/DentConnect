import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';
import 'package:template/lab/shared/models/lab_order_model.dart';

class DoctorOrdersRepo {
  final ApiService _apiService = ApiService();

  Future<ApiResponse<List<LabOrderModel>>> getDoctorOrders(
    int doctorId,
  ) async {
    final response = await _apiService.get<List<dynamic>>(
      'lab-connected-doctors/$doctorId/orders',
    );

    if (response.success && response.data != null) {
      final orders = response.data!
          .whereType<Map<String, dynamic>>()
          .map(LabOrderModel.fromJson)
          .toList();

      return ApiResponse.success(
        data: orders,
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