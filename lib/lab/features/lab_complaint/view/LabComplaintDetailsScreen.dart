import 'package:flutter/material.dart';
import 'package:template/lab/features/lab_complaint/view/wedjet_detals_lab_complaint/LabComplaintDetailsBody.dart';

import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';


class LabComplaintDetailsScreen
    extends StatelessWidget {
  const LabComplaintDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const LabBackgroundLayout(
      child:
          LabComplaintDetailsBody(),
    );
  }
}