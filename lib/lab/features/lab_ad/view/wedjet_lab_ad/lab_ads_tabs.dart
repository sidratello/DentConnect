import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/filter_item.dart';

import '../../controller/lab_ads_controller.dart';

class LabAdsTabs
    extends GetView<LabAdsController> {
  const LabAdsTabs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 54,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius:
              BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.littleBlue
                .withOpacity(.7),
          ),
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Expanded(
              child: FilterItem(
                title:
                    'في انتظار الدفع (${controller.pendingCount})',
                selected:
                    controller.selectedTab.value ==
                        LabAdsTab.pendingPayment,
                onTap: () {
                  controller.selectTab(
                    LabAdsTab.pendingPayment,
                  );
                },
                fontSize: 12,
                borderRadius: 12,
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: FilterItem(
                title:
                    'النشطة (${controller.activeCount})',
                selected:
                    controller.selectedTab.value ==
                        LabAdsTab.active,
                onTap: () {
                  controller.selectTab(
                    LabAdsTab.active,
                  );
                },
                fontSize: 13,
                borderRadius: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}