import 'package:get/get.dart';

import 'package:template/core/api.dart';

import 'package:template/lab/features/homepage/controller/homecontroller.dart';

import 'package:template/auth/controller/logout_controller.dart';
import 'package:template/auth/repository/logout_repository.dart';

class LabHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LabHomeController>(
      () => LabHomeController(),
    );

    Get.lazyPut<LogoutRepository>(
      () => LogoutRepository(
        apiService: ApiService(),
      ),
    );

    Get.lazyPut<LogoutController>(
      () => LogoutController(
        repository:
            Get.find<LogoutRepository>(),
      ),
    );
  }
}