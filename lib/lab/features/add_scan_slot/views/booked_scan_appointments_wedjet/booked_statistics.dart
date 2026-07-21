import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/lab/features/add_scan_slot/views/wedjet_scan_slots/StatisticCard.dart';

import '../../../../../../core/app_colors.dart';
import '../../controller/booked_scan_appointments_controller.dart';

class BookedAppointmentsStatistics
    extends GetView<
        BookedScanAppointmentsController> {
  const BookedAppointmentsStatistics({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: StatisticCard(
              title: 'عدد الأطباء',
              count:
                  controller.uniqueDentistsCount,
              valueColor:
                  AppColors.primaryBlue,
              iconColor:
                  AppColors.primaryBlue,
              iconBackground:
                  AppColors.primaryBlue
                      .withOpacity(0.09),
              icon:
                  Icons.person_outline_rounded,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: StatisticCard(
              title:
                  'إجمالي المواعيد المحجوزة',
              count:
                  controller.totalBookings,
              valueColor: Colors.purple,
              iconColor: Colors.purple,
              iconBackground:
                  Colors.purple.withOpacity(
                0.09,
              ),
              icon:
                  Icons.calendar_month_outlined,
            ),
          ),
        ],
      ),
    );
  }
}