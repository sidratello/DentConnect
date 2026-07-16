import 'package:get/get.dart';

import '../controller/doctor_orders_controller.dart';

class DoctorOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorOrdersController>(
      () => DoctorOrdersController(),
    );
  }
}