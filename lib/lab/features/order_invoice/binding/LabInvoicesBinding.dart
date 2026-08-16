import 'package:get/get.dart';
import 'package:template/lab/features/order_invoice/repositry/lab_invoices_repository.dart';

import '../controller/lab_invoices_controller.dart';

class LabInvoicesBinding
    extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LabInvoicesRepository>(
      () => LabInvoicesRepository(),
    );

    Get.lazyPut<LabInvoicesController>(
      () => LabInvoicesController(
        repository:
            Get.find<LabInvoicesRepository>(),
      ),
    );
  }
}