import 'package:get/get.dart';
import 'package:template/core/app_router.dart';
import 'package:template/lab/features/subscription/repositry/lab_subscription_repository.dart';

import '../model/price_info_model.dart';

class SubscriptionPlansController
    extends GetxController {
  final LabSubscriptionRepository
      repository;

  SubscriptionPlansController({
    required this.repository,
  });

  final isLoading = false.obs;
final isPaying = false.obs;
  final priceInfo =
      Rxn<SubscriptionPriceInfoModel>();

  final selectedMonths =
      RxnInt();

  @override
  void onInit() {
    super.onInit();

    getPriceInfo();
  }

  Future<void> getPriceInfo() async {
    if (isLoading.value) {
      return;
    }

    try {
      isLoading.value = true;

      final response =
          await repository.getPriceInfo();

      if (!response.success ||
          response.data == null) {
        Get.snackbar(
          'خطأ',
          response.message,
        );

        return;
      }

      priceInfo.value =
          response.data;
    } catch (_) {
      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء تحميل الباقات',
      );
    } finally {
      isLoading.value = false;
    }
  }

  void selectPlan(
    SubscriptionPriceTierModel plan,
  ) {
    selectedMonths.value =
        plan.months;
  }

  SubscriptionPriceTierModel?
      get selectedPlan {
    final months =
        selectedMonths.value;

    if (months == null) {
      return null;
    }

    for (final plan
        in priceInfo.value?.priceTiers ??
            []) {
      if (plan.months == months) {
        return plan;
      }
    }

    return null;
  }




  Future<void> paySelectedPlan() async {
  final plan = selectedPlan;

  if (plan == null) {
    Get.snackbar(
      'تنبيه',
      'يرجى اختيار مدة الاشتراك',
      snackPosition:
          SnackPosition.BOTTOM,
    );
    return;
  }

  if (isPaying.value) {
    return;
  }

  try {
    isPaying.value = true;

    final response =
        await repository
            .createSubscriptionPayment(
      months:
          plan.months,
    );

    if (!response.success ||
        response.data == null) {
      Get.snackbar(
        'خطأ',
        response.message,
        snackPosition:
            SnackPosition.BOTTOM,
      );
      return;
    }

    final payment =
        response.data!;

    final result =
        await Get.toNamed(
      AppRouter.labAdPayment,
      arguments: {
        'url':
            payment.paymentUrl,

        // نوع عملية الدفع
        'paymentType':
            'subscription',

        'months':
            payment.months,
      },
    );

    if (result ==
        'paymentSuccess') {
      // بعد نجاح الدفع
      // يمكن تحديث حالة الاشتراك هنا
      Get.back(
        result:
            'paymentSuccess',
      );
    }
  } finally {
    isPaying.value = false;
  }
}

  void goBack() {
    Get.back();
  }
}