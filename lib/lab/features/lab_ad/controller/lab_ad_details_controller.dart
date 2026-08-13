import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:template/core/app_router.dart';
import 'package:template/lab/features/lab_ad/model/lab_ad_model.dart';
import 'package:template/lab/features/lab_ad_payment/repositry/ad_payment_repository.dart';

class LabAdDetailsController
    extends GetxController {
  late final LabAdModel
      advertisement;

  final LabAdPaymentRepository
      _paymentRepository;

  LabAdDetailsController({
    required LabAdPaymentRepository
        paymentRepository,
  }) : _paymentRepository =
            paymentRepository;

  final isPaying = false.obs;

  final wasPaymentCompleted =
      false.obs;

  @override
  void onInit() {
    super.onInit();

    final argument =
        Get.arguments;

  if (argument is! LabAdModel) {
    throw ArgumentError(
      'LabAdDetailsScreen requires LabAdModel.',
    );
  }

    advertisement =

        argument;
  }

  bool get isPendingPayment =>
      !advertisement.isPaid;

  bool get isActive =>
      advertisement.isActive;

  bool get hasImages =>
      advertisement
          .images.isNotEmpty;

  String get paymentStatusText =>
      advertisement.isPaid
          ? 'تم الدفع'
          : 'غير مدفوع';

  String formatDate(
    DateTime? date,
  ) {
    if (date == null) {
      return 'غير محدد';
    }

    return DateFormat(
      'yyyy/MM/dd',
    ).format(
      date.toLocal(),
    );
  }

  String formatPrice(
    double price,
  ) {
    if (price ==
        price.roundToDouble()) {
      return price
          .toInt()
          .toString();
    }

    return price
        .toStringAsFixed(2);
  }

  Future<void>
      payAdvertisement() async {
    if (isPaying.value) {
      return;
    }

    isPaying.value = true;

    try {
      final response =
          await _paymentRepository
              .createPaymentLink(
        advertisementId:
            advertisement.id,
        currency: 'USD',
      );

      if (!response.success ||
          response.data == null) {
        Get.snackbar(
          'خطأ',
          response.message,
        );
        return;
      }
debugPrint(
  'PAY FROM DETAILS: '
  'adId=${advertisement.id}, '
  'url=${response.data!.paymentLink}',
);
      final result =
          await Get.toNamed(
        AppRouter.labAdPayment,
        arguments: {
          'url': response
              .data!
              .paymentLink,
          'advertisementId':
              advertisement.id,
        },
      );

      if (result ==
          'paymentSuccess') {
        wasPaymentCompleted
            .value = true;

        goBack();
      }
    } finally {
      isPaying.value = false;
    }
  }

  void goBack() {
    if (wasPaymentCompleted
        .value) {
      Get.back(
        result:
            'paymentSuccess',
      );
      return;
    }

    Get.back();
  }
}