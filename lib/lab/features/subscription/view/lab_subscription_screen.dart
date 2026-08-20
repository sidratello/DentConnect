import 'package:flutter/material.dart';

import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';
import 'package:template/lab/features/subscription/view/wedjet_subscription/lab_subscription_body.dart';

class LabSubscriptionScreen
    extends StatelessWidget {
  const LabSubscriptionScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const LabBackgroundLayout(
      child:
          LabSubscriptionBody(),
    );
  }
}