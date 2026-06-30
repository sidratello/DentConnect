import 'package:get/get.dart';
import '../controller/case_orders_controller.dart';

class CaseOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CaseOrdersController>(
      () => CaseOrdersController(),
    );
  }
}