import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/widgets/app_page_header_cases.dart';
import 'package:template/lab/features/order_invoice/controller/lab_invoices_controller.dart';


class LabInvoicesHeader
    extends StatelessWidget {
  const LabInvoicesHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<
            LabInvoicesController>();

    return AppPageHeader(
      title: 'الفواتير',
      subtitle:
          'سجل فواتير الطلبات والإعلانات المدفوعة',
      icon:
          Icons.receipt_long_outlined,
      onBack:
          controller.goBack,
    );
  }
}