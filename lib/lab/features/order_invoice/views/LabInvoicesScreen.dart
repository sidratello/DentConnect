import 'package:flutter/material.dart';
import 'package:template/lab/features/order_invoice/views/wedjet/LabInvoicesBody.dart';

import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';


class LabInvoicesScreen
    extends StatelessWidget {
  const LabInvoicesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const LabBackgroundLayout(
      child:
          LabInvoicesBody(),
    );
  }
}