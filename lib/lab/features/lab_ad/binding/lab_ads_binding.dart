import 'package:get/get.dart';

import 'package:template/lab/features/lab_ad_payment/repositry/ad_payment_repository.dart';

import '../controller/lab_ads_controller.dart';
import '../repository/lab_ads_repository.dart';

class LabAdsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LabAdsRepository>(
      () => LabAdsRepository(),
    );

    Get.lazyPut<LabAdPaymentRepository>(
      () => LabAdPaymentRepository(),
    );

    Get.lazyPut<LabAdsController>(
      () => LabAdsController(
        repository:
            Get.find<LabAdsRepository>(),
        paymentRepository:
            Get.find<LabAdPaymentRepository>(),
      ),
    );
  }
}