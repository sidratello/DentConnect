import 'package:template/core_dentist/api.dart';
import 'package:template/core_dentist/api_response.dart';

import '../model/payment_model.dart';

class InvoicePaymentRepository {
  final ApiService _apiService;

  InvoicePaymentRepository({
    ApiService? apiService,
  }) : _apiService = apiService ?? ApiService();

  Future<ApiResponse<PaymentLinkResponse>> createPaymentLink({
    required int orderId,
    String currency = 'USD',
  }) async {
    final response = await _apiService.post<Map<String, dynamic>>(
      'Payment/pay-order/$orderId?currency=$currency',
    );

    if (!response.success || response.data == null) {
      return ApiResponse.error(
        response.message,
        statusCode: response.statusCode,
      );
    }

    try {
      final payment = PaymentLinkResponse.fromJson(response.data!);

      if (payment.paymentLink.isEmpty) {
        return ApiResponse.error(
          'تعذر الحصول على رابط الدفع.',
          statusCode: response.statusCode,
        );
      }

      return ApiResponse.success(
        data: payment,
        message: payment.message,
        statusCode: response.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(
        'تعذر قراءة بيانات الدفع.',
        statusCode: response.statusCode,
      );
    }
  }
}
