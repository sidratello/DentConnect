import 'package:flutter/material.dart';

import '../../controller/subscription_plans_controller.dart';
import 'subscription_plan_card.dart';

class SubscriptionPlansList
    extends StatelessWidget {
  final SubscriptionPlansController
      controller;

  const SubscriptionPlansList({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final plans =
        controller
            .priceInfo
            .value
            ?.priceTiers ??
        [];

    return Column(
      children: plans
          .map(
            (plan) => Padding(
              padding:
                  const EdgeInsets.only(
                bottom: 12,
              ),
              child:
                  SubscriptionPlanCard(
                plan:
                    plan,
                selected:
                    controller
                            .selectedMonths
                            .value ==
                        plan.months,
                onTap: () {
                  controller
                      .selectPlan(
                    plan,
                  );
                },
              ),
            ),
          )
          .toList(),
    );
  }
}