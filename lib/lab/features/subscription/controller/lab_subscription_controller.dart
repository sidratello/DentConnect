import 'package:get/get.dart';
import 'package:template/lab/features/subscription/repositry/lab_subscription_repository.dart';

import '../model/status_model.dart';

class LabSubscriptionController
    extends GetxController {
  final LabSubscriptionRepository
      repository;

  LabSubscriptionController({
    required this.repository,
  });

  final isLoading = false.obs;

  final subscription =
      Rxn<LabSubscriptionStatusModel>();

  @override
  void onInit() {
    super.onInit();

    getSubscriptionStatus();
  }

  Future<void>
      getSubscriptionStatus() async {
    if (isLoading.value) {
      return;
    }

    try {
      isLoading.value = true;

      final response =
          await repository.getMyStatus();

      if (!response.success ||
          response.data == null) {
        Get.snackbar(
          'خطأ',
          response.message,
        );

        return;
      }

      subscription.value =
          response.data;
    } catch (_) {
      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء تحميل بيانات الاشتراك',
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshSubscription() async {
    await getSubscriptionStatus();
  }

  void goBack() {
    Get.back();
  }
}