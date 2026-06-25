import 'package:get/get.dart';
import '../controller/order_controller.dart';

class LabOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LabOrderController>(
      () => LabOrderController(),
    );
  }
}