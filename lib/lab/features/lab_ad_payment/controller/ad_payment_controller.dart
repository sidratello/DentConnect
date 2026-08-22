import 'package:get/get.dart';

import 'package:template/core/app_router.dart';

enum LabPaymentType {
  advertisement,
  subscription,
}

class LabAdPaymentController extends GetxController {
  late final String paymentUrl;
  int? advertisementId;

  final isPageLoading = true.obs;
  late final LabPaymentType paymentType;

  bool get isAdvertisementPayment =>
      paymentType == LabPaymentType.advertisement;

  bool get isSubscriptionPayment => paymentType == LabPaymentType.subscription;

  late final bool isPendingPayment;
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

    final paymentTypeValue =
        arguments['paymentType']?.toString() ?? 'advertisement';
    paymentType = paymentTypeValue == 'subscription'
        ? LabPaymentType.subscription
        : LabPaymentType.advertisement;
    if (paymentUrl.isEmpty) {
      throw ArgumentError(
        'Payment URL is missing.',
      );
    }

    if (isAdvertisementPayment) {
      advertisementId = arguments['advertisementId'] as int?;

      if (advertisementId == null || advertisementId! <= 0) {
        throw ArgumentError(
          'Advertisement ID is missing.',
        );
      }
    }

    isPendingPayment = arguments['isPendingPayment'] == true;
  }

  void setLoading(
    bool value,
  ) {
    isPageLoading.value = value;
  }

  Future<void> handlePaymentSuccess(
    String url,
  ) async {
    final uri = Uri.tryParse(url);

    final paymentId = uri?.queryParameters['paymentId'];

    final result = await Get.toNamed(
      AppRouter.labAdPaymentSuccess,
      arguments: {
        'paymentType': paymentType.name,
        'isPendingPayment': isPendingPayment,
        'paymentId': paymentId,
        if (advertisementId != null) 'advertisementId': advertisementId,
      },
    );

    if (result == 'paymentSuccess') {
      Get.back(
        result: 'paymentSuccess',
      );
    }
  }

  Future<void> handlePaymentFailure(
    String url,
  ) async {
    final uri = Uri.tryParse(url);

    final paymentId = uri?.queryParameters['paymentId'];

    await Get.toNamed(
      AppRouter.labAdPaymentFailed,
      arguments: {
        'paymentType': paymentType.name,
        'paymentId': paymentId,
        if (advertisementId != null) 'advertisementId': advertisementId,
      },
    );
  }

  void goBack() {
    Get.back();
  }
}
