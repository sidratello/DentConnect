import 'package:flutter/material.dart';
import 'package:template/lab/features/case_order_details/views/widget/case_order_details_actions.dart';
import 'package:template/lab/features/case_order_details/views/widget/case_order_details_body.dart';
import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';




class CaseOrderDetailsScreen extends StatelessWidget {
  const CaseOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LabBackgroundLayout(
      child: Column(
        children: [
        
          Expanded(
            child: CaseOrderDetailsBody(),
          ),
           CaseOrderDetailsActions(),
        ],
      ),
    );
  }
}