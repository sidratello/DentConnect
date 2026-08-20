import 'package:flutter/material.dart';
import 'package:template/lab/features/lab_ad/view/wedjet_lab_ad/lab_ads_body.dart';

import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';


class LabAdsScreen extends StatelessWidget {
  const LabAdsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const LabBackgroundLayout(
      child: LabAdsBody(),
    );
  }
}