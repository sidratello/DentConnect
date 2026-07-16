import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/lab/features/orderconection/views/DoctorConnectionwedjet/connected_doctors_body.dart';

import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';
import 'package:template/lab/features/orderconection/views/wedjet/order_conection_seacrch.dart';

import '../controller/connected_doctors_controller.dart';


class ConnectedDoctorsScreen extends StatelessWidget {
  const ConnectedDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ConnectedDoctorsController>();

    return LabBackgroundLayout(
      child: Column(
        children: [
          const SizedBox(height: 16),

          OrderConnectionSearchWidget(
            onChanged: controller.searchDoctors,
          ),

          const Expanded(
            child: ConnectedDoctorsBody(),
          ),
        ],
      ),
    );
  }
}