import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_router.dart';
import 'package:template/core/widgets/AppLoadingIndicator.dart';
import 'package:template/core/widgets/EmptyStateCard.dart';

import '../../controller/lab_subscription_controller.dart';

import 'lab_subscription_header.dart';
import 'subscription_action_button.dart';
import 'subscription_status_card.dart';

class LabSubscriptionBody
    extends GetView<
        LabSubscriptionController> {
  const LabSubscriptionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh:
          controller.refreshSubscription,
      child: ListView(
        physics:
            const AlwaysScrollableScrollPhysics(),
        padding:
            const EdgeInsets.only(
          bottom: 30,
        ),
        children: [
          const LabSubscriptionHeader(),

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

              final subscription =
                  controller
                      .subscription.value;

              if (subscription == null) {
                return const Padding(
                  padding:
                      EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 60,
                  ),
                  child:
                      EmptyStateCard(
                    title:
                        'تعذر تحميل الاشتراك',
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
                  children: [
                    SubscriptionStatusCard(
                      subscription:
                          subscription,
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    SubscriptionActionButton(
                      isFreeTrial:
                          subscription
                              .isFreeTrial,
                      onTap: () {
                        Get.toNamed(
                          AppRouter
                              .subscriptionPlans,
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}