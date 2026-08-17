import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';
import 'package:template/lab/features/subscription/model/subscription_payment_model.dart';

import '../model/status_model.dart';
import '../model/price_info_model.dart';

class LabSubscriptionRepository {
  final ApiService _apiService;

  LabSubscriptionRepository({
    ApiService? apiService,
  }) : _apiService =
            apiService ?? ApiService();

  Future<ApiResponse<
          LabSubscriptionStatusModel>>
      getMyStatus() async {
    final response =
        await _apiService.get<
            Map<String, dynamic>>(
      'lab-subscription-online/my-status',
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
          LabSubscriptionStatusModel
              .fromJson(
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
        'تعذر قراءة بيانات الاشتراك.',
      );
    }
  }

  Future<ApiResponse<
          SubscriptionPriceInfoModel>>
      getPriceInfo() async {
    final response =
        await _apiService.get<
            Map<String, dynamic>>(
      'lab-subscription-online/price-info',
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
          SubscriptionPriceInfoModel
              .fromJson(
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
        'تعذر قراءة أسعار الاشتراك.',
      );
    }
  }


  Future<ApiResponse<
        SubscriptionPaymentModel>>
    createSubscriptionPayment({
  required int months,
}) async {
  final response =
      await _apiService.post<
          Map<String, dynamic>>(
    'lab-subscription-online/pay',
    data: {
      'Months': months,
    },
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
    return ApiResponse.success(
      data:
          SubscriptionPaymentModel
              .fromJson(
        response.data!,
      ),
      message:
          response.message,
      statusCode:
          response.statusCode,
    );
  } catch (_) {
    return ApiResponse.error(
      'تعذر قراءة بيانات الدفع.',
    );
  }
}
}