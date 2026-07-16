import 'package:get/get.dart';
import '../controller/case_order_details_controller.dart';

class CaseOrderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CaseOrderDetailsController>(
      () => CaseOrderDetailsController(),
    );
  }
}