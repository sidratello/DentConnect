import 'package:get/get.dart';
import 'package:template/lab/features/lab_ad_payment/repositry/ad_payment_repository.dart';

import '../controller/lab_ad_details_controller.dart';

class LabAdDetailsBinding
    extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<
        LabAdPaymentRepository>(
      () => LabAdPaymentRepository(),
    );

    Get.lazyPut<
        LabAdDetailsController>(
      () => LabAdDetailsController(
        paymentRepository:
            Get.find<
                LabAdPaymentRepository>(),
      ),
    );
  }
}