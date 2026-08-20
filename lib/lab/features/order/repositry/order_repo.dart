





import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';
import 'package:template/lab/shared/models/lab_order_model.dart';

class LabOrderRepo {
  final ApiService _apiService = ApiService();
Future<ApiResponse<List<LabOrderModel>>> getOrders() async {
  
  final response = await _apiService.get<List<dynamic>>(
    'LabOrders/pending',
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

Future<ApiResponse<dynamic>> acceptOrder(int orderId) async {
  return await _apiService.post<dynamic>(
    'LabOrders/$orderId/approve',
  );
}
Future<ApiResponse<dynamic>> rejectOrder({
  required int orderId,
  required String reason,
}) async {
  return await _apiService.post<dynamic>(
    'LabOrders/$orderId/reject',
    data: {
      'reason': reason,
    },
  );
}

Future<ApiResponse<dynamic>> requestMoreInfo({
  required int orderId,
  required String message,
}) async {
  return await _apiService.post<dynamic>(
    'LabOrders/$orderId/request-info',
    data: {
      'Message': message,
    },
  );
}

}