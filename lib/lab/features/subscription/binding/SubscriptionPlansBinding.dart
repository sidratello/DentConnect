import 'package:get/get.dart';
import 'package:template/lab/features/subscription/repositry/lab_subscription_repository.dart';

import '../controller/subscription_plans_controller.dart';

class SubscriptionPlansBinding
    extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<
        LabSubscriptionRepository>(
      () =>
          LabSubscriptionRepository(),
    );

    Get.lazyPut<
        SubscriptionPlansController>(
      () =>
          SubscriptionPlansController(
        repository: Get.find(),
      ),
    );
  }
}