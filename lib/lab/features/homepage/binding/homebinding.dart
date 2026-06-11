import 'package:get/get.dart';
import 'package:template/lab/features/homepage/controller/homecontroller.dart';

class LabHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LabHomeController>(
      () => LabHomeController(),
    );
  }
}