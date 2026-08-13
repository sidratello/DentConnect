import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/lab/features/lab_ad/controller/lab_ad_details_controller.dart';
import 'package:template/lab/features/lab_ad/view/widgets_details_screen.dart/details_actions.dart';
import 'package:template/lab/features/lab_ad/view/widgets_details_screen.dart/lab_ad_details_body.dart';
import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';

class LabAdDetailsScreen
    extends GetView<
        LabAdDetailsController> {
  const LabAdDetailsScreen({
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
      child:
          const LabBackgroundLayout(
        child: Column(
          children: [
            Expanded(
              child:
                  LabAdDetailsBody(),
            ),
            LabAdDetailsActions(),
          ],
        ),
      ),
    );
  }
}