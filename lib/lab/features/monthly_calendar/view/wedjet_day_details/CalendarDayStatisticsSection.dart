import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/lab/shared/wedjet/StatisticCard.dart';

class CalendarDayStatisticsSection
    extends StatelessWidget {
  final int ordersCount;
  final int scanVisitsCount;

  const CalendarDayStatisticsSection({
    super.key,
    required this.ordersCount,
    required this.scanVisitsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: StatisticCard(
            title: 'طلبات الأطباء',
            count: ordersCount,
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
            count: scanVisitsCount,
            valueColor:
                AppColors.green,
            iconColor:
                AppColors.green,
            iconBackground:
                AppColors.green
                    .withOpacity(.12),
            icon: Icons
                .document_scanner_outlined,
          ),
        ),
      ],
    );
  }
}