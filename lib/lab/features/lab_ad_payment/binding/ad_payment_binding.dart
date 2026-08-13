import 'package:get/get.dart';

import '../controller/ad_payment_controller.dart';
class LabAdPaymentBinding
    extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<
        LabAdPaymentController>(
      () => LabAdPaymentController(),
    );
  }
}