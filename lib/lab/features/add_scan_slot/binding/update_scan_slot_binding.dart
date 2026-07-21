import 'package:get/get.dart';

import '../controller/update_scan_slot_controller.dart';

class UpdateScanSlotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateScanSlotController>(
      () => UpdateScanSlotController(),
    );
  }
}