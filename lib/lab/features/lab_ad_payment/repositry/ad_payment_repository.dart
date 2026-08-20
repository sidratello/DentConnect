import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';
import 'package:template/lab/features/lab_ad_payment/model/payment_model.dart';


class LabAdPaymentRepository {
  final ApiService _apiService;

  LabAdPaymentRepository({
    ApiService? apiService,
  }) : _apiService =
            apiService ?? ApiService();

  Future<ApiResponse<PaymentLinkResponse>>
      createPaymentLink({
    required int advertisementId,
    String currency = 'USD',
  }) async {
    final response =
        await _apiService.post<
            Map<String, dynamic>>(
      'Advertisement/pay-advertisement/$advertisementId?currency=$currency',
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
      final payment =
          PaymentLinkResponse.fromJson(
        response.data!,
      );

      if (payment.paymentLink.isEmpty) {
        return ApiResponse.error(
          'تعذر الحصول على رابط الدفع.',
          statusCode:
              response.statusCode,
        );
      }

      return ApiResponse.success(
        data: payment,
        message:
            payment.message,
        statusCode:
            response.statusCode,
      );
    } catch (_) {
      return ApiResponse.error(
        'تعذر قراءة بيانات الدفع.',
        statusCode:
            response.statusCode,
      );
    }
  }
}