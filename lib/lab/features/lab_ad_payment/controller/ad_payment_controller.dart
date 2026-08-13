import 'package:get/get.dart';

import 'package:template/core/app_router.dart';

class LabAdPaymentController
    extends GetxController {
  late final String paymentUrl;
  late final int advertisementId;

  final isPageLoading = true.obs;

  @override
  void onInit() {
    super.onInit();

    final arguments =
        Get.arguments;

    if (arguments is! Map) {
      throw ArgumentError(
        'Payment screen requires arguments.',
      );
    }

    paymentUrl =
        arguments['url']
                ?.toString() ??
            '';

    advertisementId =
        arguments[
                    'advertisementId']
                as int? ??
            0;

    if (paymentUrl.isEmpty) {
      throw ArgumentError(
        'Payment URL is missing.',
      );
    }

    if (advertisementId <= 0) {
      throw ArgumentError(
        'Advertisement ID is missing.',
      );
    }
  }

  void setLoading(
    bool value,
  ) {
    isPageLoading.value =
        value;
  }

  Future<void>
      handlePaymentSuccess(
    String url,
  ) async {
    final uri =
        Uri.tryParse(url);

    final paymentId =
        uri?.queryParameters[
            'paymentId'];

    final result =
        await Get.toNamed(
      AppRouter
          .labAdPaymentSuccess,
      arguments: {
        'advertisementId':
            advertisementId,
        'paymentId':
            paymentId,
      },
    );

    if (result ==
        'paymentSuccess') {
      Get.back(
        result:
            'paymentSuccess',
      );
    }
  }

  Future<void>
      handlePaymentFailure(
    String url,
  ) async {
    final uri =
        Uri.tryParse(url);

    final paymentId =
        uri?.queryParameters[
            'paymentId'];

    await Get.toNamed(
      AppRouter
          .labAdPaymentFailed,
      arguments: {
        'advertisementId':
            advertisementId,
        'paymentId':
            paymentId,
      },
    );
  }

  void goBack() {
    Get.back();
  }
}