import 'package:get/get.dart';

import 'package:template/auth/controller/forpa_controller.dart';

class ForgetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordController());
  }
}