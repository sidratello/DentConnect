/// ======================================
/// order_connection_screen.dart
/// ======================================

import 'package:flutter/material.dart';
import 'package:template/lab/features/orderconection/controller/connected_doctors_controller.dart';
import 'package:template/lab/features/orderconection/controller/order_connection_controller.dart';
import 'package:template/lab/features/orderconection/views/DoctorConnectionwedjet/connected_doctors_body.dart';
import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';
import 'package:template/lab/features/orderconection/views/wedjet/order_conection_seacrch.dart';
import 'package:template/lab/features/orderconection/views/wedjet/order_connec_tabs.dart';

import 'package:template/lab/features/orderconection/views/wedjet/order_connection_body.dart';

import 'package:template/lab/features/orderconection/views/wedjet/order_connection_header.dart';



import 'package:get/get.dart';




class OrderConnectionScreen extends StatelessWidget {
  const OrderConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OrderConnectionController>();

    final connectedDoctorsController =
        Get.find<ConnectedDoctorsController>();

    return LabBackgroundLayout(
      child: Column(
        children: [
          const OrderConnectionHeaderWidget(),

          OrderConnectionSearchWidget(


            onChanged: (value) {
              if (controller.selectedTab.value ==
                  OrderConnectionTab.connectedDoctors) {
                connectedDoctorsController.searchDoctors(value);
              } else {
                controller.searchRequests(value);
              }
            },
          ),

          const OrderConnectionTabs(),

          Expanded(
            child: Obx(() {
              switch (controller.selectedTab.value) {
                case OrderConnectionTab.connectionRequests:
                  return const OrderConnectionBodyWidget();

                case OrderConnectionTab.connectedDoctors:
                  return const ConnectedDoctorsBody();
              }
            }),
          ),
        ],
      ),
    );
  }
}