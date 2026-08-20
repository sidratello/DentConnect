import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/lab/features/monthly_calendar/view/wedjet_mothly_calander/calendar_days_grid.dart';
import 'package:template/lab/features/monthly_calendar/view/wedjet_mothly_calander/calendar_legend.dart';
import 'package:template/lab/features/monthly_calendar/view/wedjet_mothly_calander/calendar_week_days_header.dart';

class MonthlyCalendarGrid
    extends StatelessWidget {
  const MonthlyCalendarGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        10,
        15,
        10,
        17,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius:
            BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.littleBlue
              .withOpacity(.5),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkBlue
                .withOpacity(.04),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const CalendarWeekDaysHeader(),

          const SizedBox(height: 9),

          Divider(
            height: 1,
            color: AppColors.littleBlue
                .withOpacity(.4),
          ),

          const SizedBox(height: 10),

          const CalendarDaysGrid(),

          const SizedBox(height: 6),

           const CalendarLegend(),
        ],
      ),
    );
  }
}