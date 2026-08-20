import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/widgets/filter_item.dart';

import '../../../../../../core/app_colors.dart';
import '../../controller/scan_slots_controller.dart';


class ScanFilterTabs extends GetView<ScanSlotsController> {
  const ScanFilterTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: AppColors.littleBlue.withOpacity(0.65),
        ),
      ),
      child: Obx(
        () => Row(
          children: [
            Expanded(
              child: FilterItem(
                title: 'الكل',
                   fontSize: 15,
                selected:
                    controller.selectedFilter.value ==
                        ScanSlotFilter.all,
                onTap: () {
                  controller.changeFilter(
                    ScanSlotFilter.all,
                  );
                },
              ),
            ),
            Expanded(
              child: FilterItem(
                title: 'المتاحة',
                   fontSize: 15,
                selected:
                    controller.selectedFilter.value ==
                        ScanSlotFilter.available,
                onTap: () {
                  controller.changeFilter(
                    ScanSlotFilter.available,
                  );
                },
              ),
            ),
            Expanded(
              child: FilterItem(
                title: 'المحجوزة',
                   fontSize: 15,
                selected:
                    controller.selectedFilter.value ==
                        ScanSlotFilter.booked,
                onTap: () {
                  controller.changeFilter(
                    ScanSlotFilter.booked,
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
