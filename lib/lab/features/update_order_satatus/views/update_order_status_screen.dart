import 'package:flutter/material.dart';

import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';
import 'package:template/lab/features/update_order_satatus/views/wedjet/update_order_status_body.dart';


class UpdateOrderStatusScreen extends StatelessWidget {
  const UpdateOrderStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LabBackgroundLayout(
      child: Column(
        children: [

          Expanded(
            child: UpdateOrderStatusBody(),
          ),
        ],
      ),
    );
  }
}