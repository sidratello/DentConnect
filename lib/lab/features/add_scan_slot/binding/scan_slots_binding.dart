import 'package:get/get.dart';

import '../controller/scan_slots_controller.dart';

class ScanSlotsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanSlotsController>(
      () => ScanSlotsController(),
    );
  }
}