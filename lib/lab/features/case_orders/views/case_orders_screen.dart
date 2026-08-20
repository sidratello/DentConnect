import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';

import '../controller/case_orders_controller.dart';
import 'widget/case_orders_body.dart';

class CaseOrdersScreen
    extends GetView<CaseOrdersController> {
  const CaseOrdersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (
        didPop,
        result,
      ) {
        if (didPop) {
          return;
        }

        controller.goBack();
      },
      child: const LabBackgroundLayout(
        child: CaseOrdersBody(),
      ),
    );
  }
}