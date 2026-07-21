import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/app_colors.dart';
import '../../../../../../core/app_text_styles.dart';
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
              child: _FilterItem(
                title: 'الكل',
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
              child: _FilterItem(
                title: 'المتاحة',
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
              child: _FilterItem(
                title: 'المحجوزة',
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

class _FilterItem extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _FilterItem({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      decoration: BoxDecoration(
        color: selected
            ? AppColors.primaryBlue
            : Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        boxShadow: selected
            ? [
                BoxShadow(
                  color:
                      AppColors.primaryBlue.withOpacity(0.20),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Center(
          child: Text(
            title,
            style:
                AppTextStyles.ibmRegular14NeutralStyle.copyWith(
              color: selected
                  ? AppColors.white
                  : AppColors.darkBlue,
              fontWeight: selected
                  ? FontWeight.w700
                  : FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}