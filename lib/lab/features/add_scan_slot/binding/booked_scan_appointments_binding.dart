import 'package:get/get.dart';
import 'package:template/lab/features/add_scan_slot/controller/booked_scan_appointments_controller.dart';


class BookedScanAppointmentsBinding
    extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<
        BookedScanAppointmentsController>(
      () =>
          BookedScanAppointmentsController(),
    );
  }
}