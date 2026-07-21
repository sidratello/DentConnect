import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/lab/features/add_scan_slot/views/wedjet_scan_slots/StatisticCard.dart';

import '../../../../../../core/app_colors.dart';
import '../../controller/scan_slots_controller.dart';

class ScanStatisticsRow extends GetView<ScanSlotsController> {
  const ScanStatisticsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: StatisticCard(
              title: 'المحجوز ',
              count: controller.bookedCount,
              valueColor: const Color(0xFF6D28D9),
              iconColor: const Color(0xFF7C3AED),
              iconBackground: const Color(0xFFF3E8FF),
              icon: Icons.person_outline_rounded,
  //               onTap: () {
  //   Get.toNamed(
  //     AppRouter.bookedScanAppointments,
  //   );
  // },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: StatisticCard(
              title: 'إجمالي المواعيد',
              count: controller.totalCount,
              valueColor: AppColors.primaryBlue,
              iconColor: AppColors.primaryBlue,
              iconBackground:
                  AppColors.littleBlue.withOpacity(0.4),
              icon: Icons.calendar_month_outlined,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: StatisticCard(
              title: 'المتاح',
              count: controller.availableCount,
              valueColor: AppColors.green,
              iconColor: AppColors.green,
              iconBackground:
                  AppColors.green.withOpacity(0.10),
              icon: Icons.event_available_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
