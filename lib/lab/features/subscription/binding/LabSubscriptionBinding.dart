import 'package:get/get.dart';
import 'package:template/lab/features/subscription/repositry/lab_subscription_repository.dart';

import '../controller/lab_subscription_controller.dart';

class LabSubscriptionBinding
    extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<
        LabSubscriptionRepository>(
      () =>
          LabSubscriptionRepository(),
    );

    Get.lazyPut<
        LabSubscriptionController>(
      () => LabSubscriptionController(
        repository: Get.find(),
      ),
    );
  }
}