import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/widgets/AppLoadingIndicator.dart';
import 'package:template/core/widgets/EmptyStateCard.dart';

import '../../controller/subscription_plans_controller.dart';

import 'subscription_continue_button.dart';
import 'subscription_plans_header.dart';
import 'subscription_plans_list.dart';

class SubscriptionPlansBody
    extends GetView<
        SubscriptionPlansController> {
  const SubscriptionPlansBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics:
          const AlwaysScrollableScrollPhysics(),
      padding:
          const EdgeInsets.only(
        bottom: 30,
      ),
      children: [
        const SubscriptionPlansHeader(),

        Obx(
          () {
            if (controller
                .isLoading.value) {
              return const Padding(
                padding:
                    EdgeInsets.only(
                  top: 100,
                ),
                child:
                    AppLoadingIndicator(
                  size: 32,
                ),
              );
            }

            final info =
                controller
                    .priceInfo.value;

            if (info == null) {
              return const Padding(
                padding:
                    EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 60,
                ),
                child:
                    EmptyStateCard(
                  title:
                      'تعذر تحميل الخطط',
                  subtitle:
                      'يرجى المحاولة مرة أخرى.',
                  icon: Icons
                      .workspace_premium_outlined,
                ),
              );
            }

            return Padding(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.stretch,
                children: [
         

                  const Text(
                    'اختر مدة الاشتراك',
                    textAlign:
                        TextAlign.right,
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  SubscriptionPlansList(
                    controller:
                        controller,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                 SubscriptionContinueButton(
  enabled:
      controller.selectedPlan !=
          null,
  onTap:
      controller.paySelectedPlan,
  isLoading:
      controller.isPaying.value,
),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}