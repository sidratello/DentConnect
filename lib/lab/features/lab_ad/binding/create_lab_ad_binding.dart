import 'package:get/get.dart';
import 'package:template/lab/features/lab_ad/repository/create_advertisement_response.dart';

import '../controller/create_lab_ad_controller.dart';

class CreateLabAdBinding
    extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LabAdRepository>(
      () => LabAdRepository(),
    );

    Get.lazyPut<
        CreateLabAdController>(
      () => CreateLabAdController(
        repository:
            Get.find<LabAdRepository>(),
      ),
    );
  }
}