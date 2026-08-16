import 'package:get/get.dart';
import 'package:template/lab/features/lab_complaint/controller/LabComplaintDetailsController.dart';
import 'package:template/lab/features/lab_complaint/repositry/lab_complaints_repository.dart';



class LabComplaintDetailsBinding
    extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<
        LabComplaintsRepository>()) {
      Get.lazyPut<
          LabComplaintsRepository>(
        () =>
            LabComplaintsRepository(),
      );
    }

    Get.lazyPut<
        LabComplaintDetailsController>(
      () =>
          LabComplaintDetailsController(
        repository:
            Get.find<
                LabComplaintsRepository>(),
      ),
    );
  }
}