import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:template/lab/features/profile/controller/profilecontroller.dart';

class LabProfileBinding extends Bindings {

  @override
  void dependencies() {

    Get.lazyPut<LabProfileController>(
      () => LabProfileController(),
    );

  }
}