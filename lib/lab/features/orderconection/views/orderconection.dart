/// ======================================
/// order_connection_screen.dart
/// ======================================

import 'package:flutter/material.dart';
import 'package:template/lab/features/orderconection/controller/order_connection_controller.dart';
import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';
import 'package:template/lab/features/orderconection/views/wedjet/order_conection_seacrch.dart';

import 'package:template/lab/features/orderconection/views/wedjet/order_connection_body.dart';

import 'package:template/lab/features/orderconection/views/wedjet/order_connection_header.dart';



import 'package:get/get.dart';



class OrderConnectionScreen extends StatelessWidget {
  const OrderConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OrderConnectionController>();

    return  LabBackgroundLayout(
  child: Column(
    children: [

      const OrderConnectionHeaderWidget(),

      OrderConnectionSearchWidget(
        onChanged: controller.searchRequests,
      ),

      Expanded(
        child: OrderConnectionBodyWidget(),
      ),
    ],
  ),
);
  }
}