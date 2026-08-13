import 'package:flutter/material.dart';
import 'package:template/lab/features/lab_ad_payment/view/widgets/ad_payment_body.dart';

import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';


class LabAdPaymentScreen
    extends StatelessWidget {
  const LabAdPaymentScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const LabBackgroundLayout(
      child: LabAdPaymentBody(),
    );
  }
}