import 'package:flutter/material.dart';

import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';
import 'package:template/lab/features/subscription/view/wedjet_plan/subscription_plans_body.dart';


class SubscriptionPlansScreen
    extends StatelessWidget {
  const SubscriptionPlansScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const LabBackgroundLayout(
      child:
          SubscriptionPlansBody(),
    );
  }
}