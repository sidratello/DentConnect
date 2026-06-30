import 'package:flutter/material.dart';
import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';
import 'widget/case_orders_body.dart';

class CaseOrdersScreen extends StatelessWidget {
  const CaseOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LabBackgroundLayout(
      child: CaseOrdersBody(),
    );
  }
}