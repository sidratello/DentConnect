import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/lab/features/case_order_details/controller/case_order_details_controller.dart';
import 'package:template/lab/features/case_order_details/views/widget/case_order_details_actions.dart';
import 'package:template/lab/features/case_order_details/views/widget/case_order_details_body.dart';
import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';

class CaseOrderDetailsScreen
    extends GetView<CaseOrderDetailsController> {
  const CaseOrderDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (
        bool didPop,
        Object? result,
      ) {
        if (didPop) {
          return;
        }

        controller.goBack();
      },
      child: const LabBackgroundLayout(
        child: Column(
          children: [
            Expanded(
              child: CaseOrderDetailsBody(),
            ),
            CaseOrderDetailsActions(),
          ],
        ),
      ),
    );
  }
}