import 'package:get/get.dart';
import 'package:template/lab/features/lab_complaint/repositry/lab_complaints_repository.dart';

import '../controller/lab_complaints_controller.dart';

class LabComplaintsBinding
    extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<
        LabComplaintsRepository>(
      () =>
          LabComplaintsRepository(),
    );

    Get.lazyPut<
        LabComplaintsController>(
      () => LabComplaintsController(
        repository:
            Get.find<
                LabComplaintsRepository>(),
      ),
    );
  }
}