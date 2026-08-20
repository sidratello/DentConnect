import 'package:flutter/material.dart';
import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';
import 'widget/case_status_body.dart';


class CaseStatusScreen extends StatelessWidget {
  const CaseStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LabBackgroundLayout(
      child: CaseStatusBody(),
    );
  }
}