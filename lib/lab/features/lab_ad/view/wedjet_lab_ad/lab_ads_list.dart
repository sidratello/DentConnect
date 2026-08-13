import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/widgets/AppLoadingIndicator.dart';
import 'package:template/core/widgets/EmptyStateCard.dart';

import '../../controller/lab_ads_controller.dart';
import 'lab_ad_card.dart';

class LabAdsList
    extends GetView<LabAdsController> {
  const LabAdsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isCurrentTabLoading) {
          return const Center(
            child: AppLoadingIndicator(
              size: 32,
            ),
          );
        }

        final error = controller.currentError;

        if (error != null &&
            error.trim().isNotEmpty) {
          return RefreshIndicator(
            onRefresh:
                controller.refreshCurrentTab,
            child: ListView(
              physics:
                  const AlwaysScrollableScrollPhysics(),
              children: [
                EmptyStateCard(
                  title:
                      'تعذر تحميل الإعلانات',
                  subtitle:
                      '$error\nاسحب للأسفل لإعادة المحاولة.',
                  icon:
                      Icons.error_outline_rounded,
                ),
              ],
            ),
          );
        }

        final advertisements =
            controller.currentAds;

        if (advertisements.isEmpty) {
          return RefreshIndicator(
            onRefresh:
                controller.refreshCurrentTab,
            child: ListView(
              physics:
                  const AlwaysScrollableScrollPhysics(),
              children: [
                EmptyStateCard(
                  title: controller.isPendingTab
                      ? 'لا توجد إعلانات بانتظار الدفع'
                      : 'لا توجد إعلانات نشطة',
                  subtitle: controller.isPendingTab
                      ? 'الإعلانات المعتمدة التي تحتاج إلى دفع ستظهر هنا.'
                      : 'الإعلانات الفعالة ستظهر هنا بعد إتمام الدفع.',
                  icon:
                      Icons.campaign_outlined,
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh:
              controller.refreshCurrentTab,
          child: ListView.separated(
            physics:
                const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.only(
              bottom: 24,
            ),
            itemCount:
                advertisements.length,
            separatorBuilder:
                (_, __) =>
                    const SizedBox(
              height: 12,
            ),
            itemBuilder: (
              context,
              index,
            ) {
              final advertisement =
                  advertisements[index];

              return LabAdCard(
                advertisement:
                    advertisement,
                isPendingPayment:
                    controller.isPendingTab,
                onDetails: () {
   
    controller.openAdvertisementDetails(
      advertisement,
    );
  
                },
                onPay: () {
                  controller.payAdvertisement(
                    advertisement,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}