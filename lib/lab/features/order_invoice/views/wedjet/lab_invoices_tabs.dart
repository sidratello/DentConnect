import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/filter_item.dart';

import '../../controller/lab_invoices_controller.dart';
class LabInvoicesTabs
    extends GetView<
        LabInvoicesController> {
  const LabInvoicesTabs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 50,
        padding:
            const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius:
              BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.littleBlue
                .withOpacity(.6),
          ),
        ),
        child: Row(
          textDirection:
              TextDirection.rtl,
          children: [
            Expanded(
              child: FilterItem(
                title:
                    'فواتير الإعلانات',
                selected:
                    controller.isAdsTab,
                onTap: () {
                  controller.selectTab(
                    LabInvoicesTab.ads,
                  );
                },
              ),
            ),

            const SizedBox(
              width: 6,
            ),

            Expanded(
              child: FilterItem(
                title:
                    'فواتير الطلبات',
                selected:
                    controller
                        .isOrdersTab,
                onTap: () {
                  controller.selectTab(
                    LabInvoicesTab.orders,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}