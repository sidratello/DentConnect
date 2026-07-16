import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:template/lab/features/orderconection/controller/connected_doctors_controller.dart';
import 'package:template/lab/features/orderconection/controller/order_connection_controller.dart';

class OrderConnectionBinding extends Bindings {

  @override
  void dependencies() {


    Get.lazyPut<OrderConnectionController>(
      () => OrderConnectionController(),
    );
     Get.lazyPut<ConnectedDoctorsController>(
      () => ConnectedDoctorsController(),
    );
  }
}