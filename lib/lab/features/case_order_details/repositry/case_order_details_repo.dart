import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';
import 'package:template/lab/shared/models/lab_order_model.dart';

import '../model/order_quote_model.dart';

class CaseOrderDetailsRepo {
  final ApiService _apiService = ApiService();

  Future<ApiResponse<LabOrderModel>> getOrderDetails(int orderId) async {
    final response = await _apiService.get<Map<String, dynamic>>(
      'lab-order-status/$orderId',
    );

    if (response.success && response.data != null) {
      return ApiResponse.success(
        data: LabOrderModel.fromJson(response.data!),
        message: response.message,
        statusCode: response.statusCode,
      );
    }

    return ApiResponse.error(response.message);
  }

  Future<ApiResponse<OrderQuoteModel>> getOrderQuote(int orderId) async {
    final response = await _apiService.get<Map<String, dynamic>>(
      'lab-orders/$orderId/quote',
    );

    if (response.success && response.data != null) {
      return ApiResponse.success(
        data: OrderQuoteModel.fromJson(response.data!),
        message: response.message,
        statusCode: response.statusCode,
      );
    }

    return ApiResponse.error(response.message);
  }

  Future<ApiResponse<dynamic>> updateFinalPrice({
    required int orderId,
    required double finalPrice,
  }) async {
    return await _apiService.post<dynamic>(
      'lab-orders/$orderId/quote/final-price',
      data: {
        'FinalPrice': finalPrice,
      },
    );
  }
}