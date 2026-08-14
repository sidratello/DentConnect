import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/widgets/AppLoadingIndicator.dart';
import 'package:template/core/widgets/EmptyStateCard.dart';

import '../../controller/lab_ad_feed_controller.dart';
import 'lab_ad_feed_card.dart';
import 'lab_ad_feed_header.dart';

class LabAdFeedBody
    extends GetView<
        LabAdFeedController> {
  const LabAdFeedBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller
                .isLoading.value &&
            controller
                .advertisements
                .isEmpty) {
          return const Center(
            child:
                AppLoadingIndicator(
              size: 32,
            ),
          );
        }

        return RefreshIndicator(
          onRefresh:
              controller
                  .refreshAdvertisements,
          child: ListView(
            physics:
                const AlwaysScrollableScrollPhysics(),
            padding:
                const EdgeInsets.fromLTRB(
              20,
              4,
              20,
              30,
            ),
            children: [
              const LabAdFeedHeader(),

              const SizedBox(
                height: 10,
              ),

              if (controller
                      .errorMessage.value !=
                  null)
                EmptyStateCard(
                  title:
                      'تعذر تحميل الإعلانات',
                  subtitle:
                      '${controller.errorMessage.value}\nاسحب للأسفل لإعادة المحاولة.',
                  icon: Icons
                      .error_outline_rounded,
                )
              else if (controller
                  .advertisements
                  .isEmpty)
                const EmptyStateCard(
                  title:
                      'لا توجد إعلانات حالياً',
                  subtitle:
                      'ستظهر الإعلانات الجديدة هنا عند توفرها.',
                  icon: Icons
                      .campaign_outlined,
                )
              else
                ...controller
                    .advertisements
                    .map(
                  (
                    advertisement,
                  ) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(
                        bottom: 15,
                      ),
                      child:
                          LabAdFeedCard(
                        advertisement:
                            advertisement,
                      ),
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}