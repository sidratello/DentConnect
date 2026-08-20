import 'package:flutter/material.dart';
import 'package:template/lab/features/lab_complaint/view/wedjet/LabComplaintsBody.dart';

import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';


class LabComplaintsScreen
    extends StatelessWidget {
  const LabComplaintsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const LabBackgroundLayout(
      child:
          LabComplaintsBody(),
    );
  }
}