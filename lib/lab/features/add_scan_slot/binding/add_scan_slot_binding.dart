import 'package:get/get.dart';

import '../controller/add_scan_slot_controller.dart';

class AddScanSlotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddScanSlotController>(
      () => AddScanSlotController(),
    );
  }
}