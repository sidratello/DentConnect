import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:template/auth/controller/signup_controller.dart';


class SignupBinding  implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
  }
}
