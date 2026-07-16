import 'package:get/get.dart';
import 'package:template/lab/features/update_order_satatus/controller/update_order_status_controller.dart';


class UpdateOrderStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateOrderStatusController());
  }
}