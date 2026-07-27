import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/lab/features/monthly_calendar/controller/monthly_calendar_controller.dart';
import 'package:template/lab/shared/wedjet/StatisticCard.dart';

class CalendarStatisticsSection
    extends GetView<
        MonthlyCalendarController> {
  const CalendarStatisticsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: StatisticCard(
              title: 'طلبات الأطباء',
              count:
                  controller.totalOrders,
              valueColor:
                  AppColors.primaryBlue,
              iconColor:
                  AppColors.primaryBlue,
              iconBackground:
                  AppColors.littleBlue,
              icon:
                  Icons.assignment_outlined,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: StatisticCard(
              title: 'حجوزات المسح',
              count: controller
                  .totalScanVisits,
              valueColor:
                  AppColors.green,
              iconColor: AppColors.green,
              iconBackground:
                  AppColors.green
                      .withOpacity(0.12),
              icon: Icons
                  .document_scanner_outlined,
            ),
          ),
        ],
      ),
    );
  }
}