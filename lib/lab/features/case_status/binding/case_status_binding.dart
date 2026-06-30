import 'package:get/get.dart';
import 'package:template/lab/features/case_status/controller/case_status_controller.dart';


class CaseStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CaseStatusController>(
      () => CaseStatusController(),
    );
  }
}