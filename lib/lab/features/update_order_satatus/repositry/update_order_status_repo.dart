import 'dart:io';

import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';
import 'package:template/lab/shared/models/lab_order_model.dart';

class UpdateOrderStatusRepo {
  final ApiService _apiService = ApiService();

  Future<ApiResponse<LabOrderModel>> updateOrderStatus({
    required int orderId,
    required int status,
    String? notes,
    File? resultImage,
  }) async {
    final response = await _apiService.put<Map<String, dynamic>>(
      'lab-order-status/$orderId',
      data: {
        'Status': status,
        if (notes != null && notes.trim().isNotEmpty)
          'Notes': notes.trim(),
      },
      file: resultImage,
      fileKey: 'ResultImage',
    );

    if (response.success && response.data != null) {
      return ApiResponse.success(
        data: LabOrderModel.fromJson(response.data!),
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