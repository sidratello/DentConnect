import 'package:get/get.dart';
import 'package:template/core/api_response.dart';
import 'package:template/core/app_router.dart';
import 'package:template/core/storage_services.dart';
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
  late final bool isPendingPayment;

  int? labId;
  int? userId;
  @override
  void onInit() {
    super.onInit();
 final arguments = Get.arguments;
 isPendingPayment =
        arguments is Map &&
        arguments['isPendingPayment'] == true;

    if (isPendingPayment) {
      labId = StorageService.to.read<int>(
        'labId',
      );

      userId = StorageService.to.read<int>(
        'userId',
      );
    }
    getPriceInfo();
  }

  Future<void> getPriceInfo() async {
    if (isLoading.value) {
      return;
    }

    try {
      isLoading.value = true;
ApiResponse<SubscriptionPriceInfoModel>
        response;
    if (isPendingPayment) {
      if (labId == null || userId == null) {
        Get.snackbar(
          'خطأ',
          'تعذر العثور على بيانات الحساب.',
          snackPosition:
              SnackPosition.BOTTOM,
        );
        return;
      }
      response =
          await repository.getPendingPriceInfo(
        labId: labId!,
        userId: userId!,
      );}
      else {
      response =
          await repository.getPriceInfo();
    }

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

      priceInfo.value =
          response.data;
    } catch (_) {
      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء تحميل الخطط.',
           snackPosition:
          SnackPosition.BOTTOM,
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

  late final response;
      if (isPendingPayment) {
      if (labId == null || userId == null) {
        Get.snackbar(
          'خطأ',
          'تعذر العثور على بيانات الحساب.',
          snackPosition:
              SnackPosition.BOTTOM,
        );
        return;
      }   response =
          await repository
              .createPendingSubscriptionPayment(
        labId: labId!,
        userId: userId!,
        months: plan.months,
      );}else {
      response =
          await repository
              .createSubscriptionPayment(
        months: plan.months,
      );
    }

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
   'isPendingPayment':
            isPendingPayment,
        'months':
            payment.months,
                    if (isPendingPayment) ...{
          'labId': labId,
          'userId': userId,
        },
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