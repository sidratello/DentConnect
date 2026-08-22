import 'package:get/get.dart';

import '../controller/invoice_payment_controller.dart';

class InvoicePaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvoicePaymentController>(
      () => InvoicePaymentController(),
    );
  }
}
