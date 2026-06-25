

import 'package:flutter/material.dart';
import 'package:template/lab/features/order/views/order_detals_wedjet/order_details_actions.dart';
import 'package:template/lab/features/order/views/order_detals_wedjet/order_details_body.dart';
import 'package:template/lab/features/order/views/order_detals_wedjet/order_details_header.dart';
import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';


class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LabBackgroundLayout(
      child: Column(
        children: [
          OrderDetailsHeaderWidget(),
          Expanded(
            child: OrderDetailsBodyWidget(),
          ),
          OrderDetailsActionsWidget(),
        ],
      ),
    );
  }
}