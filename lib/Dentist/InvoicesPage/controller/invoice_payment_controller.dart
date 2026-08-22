import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_router.dart';

class InvoicePaymentController extends GetxController {
  late final String paymentUrl;
  late final int orderId;

  final isPageLoading = true.obs;

  @override
  void onInit() {
    super.onInit();

    final arguments = Get.arguments;

    if (arguments is! Map) {
      throw ArgumentError(
        'Payment screen requires arguments.',
      );
    }

    paymentUrl = arguments['url']?.toString() ?? '';

    orderId = arguments['orderId'] as int;

    if (paymentUrl.isEmpty) {
      throw ArgumentError(
        'Payment URL is missing.',
      );
    }

    if (orderId <= 0) {
      throw ArgumentError(
        'Order ID is missing.',
      );
    }
  }

  void setLoading(
    bool value,
  ) {
    isPageLoading.value = value;
  }

  Future<void> handlePaymentCallback(
    String url,
  ) async {
    final uri = Uri.tryParse(url);

    if (uri == null) {
      Get.snackbar(
        'خطأ',
        'رابط الدفع غير صالح',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final paymentId =
        uri.queryParameters['paymentId'] ?? uri.queryParameters['Id'];

    if (paymentId == null || paymentId.isEmpty) {
      Get.snackbar(
        'خطأ',
        'لم يتم العثور على معرف عملية الدفع',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    debugPrint(
      'Payment ID: $paymentId',
    );

    final result = await Get.toNamed(
      AppRouter.invoicePaymentSuccess,
      arguments: {
        'orderId': orderId,
        'paymentId': paymentId,
      },
    );

    if (result == 'paymentSuccess') {
      Get.back(
        result: 'paymentSuccess',
      );
    }
  }

  void handlePaymentSuccess(String url) {
    debugPrint('Payment success: $url');

    Get.toNamed(
      AppRouter.invoicePaymentSuccess,
      arguments: {
        'orderId': orderId,
        'url': url,
      },
    );
  }

  Future<void> handlePaymentFailure(
    String url,
  ) async {
    final uri = Uri.tryParse(url);

    final paymentId = uri?.queryParameters['paymentId'];

    await Get.toNamed(
      AppRouter.invoicePaymentFailed,
      arguments: {
        'orderId': orderId,
        'paymentId': paymentId,
      },
    );
  }

  void goBack() {
    Get.back();
  }
}
