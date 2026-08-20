import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/lab/features/order/views/order_wedjet/order_body.dart';

import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';
import '../controller/order_controller.dart';
class LabOrderScreen extends StatelessWidget {
  const LabOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<LabOrderController>();

    return const LabBackgroundLayout(
      child: LabOrderBodyWidget(),
    );
  }
}