import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/AppLoadingIndicator.dart';
import 'package:template/core/widgets/EmptyStateCard.dart';
import 'package:template/lab/features/monthly_calendar/controller/monthly_calendar_controller.dart';
import 'package:template/lab/features/monthly_calendar/view/wedjet_mothly_calander/calendar_statistics_section.dart';
import 'package:template/lab/features/monthly_calendar/view/wedjet_mothly_calander/monthly_calendar_grid.dart';
import 'package:template/lab/features/monthly_calendar/view/wedjet_mothly_calander/monthly_calendar_header.dart';
import 'package:template/lab/shared/wedjet/scan_date_navigation_card.dart';


class MonthlyCalendarBody extends GetView<
    MonthlyCalendarController>  {
  const MonthlyCalendarBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MonthlyCalendarHeader(),
        Expanded(
          child: Obx(
            () {
              if (controller.isLoading.value &&
                  controller.calendar.value ==
                      null) {
                return const AppLoadingIndicator();
              }

              return RefreshIndicator(
                color: AppColors.primaryBlue,
                onRefresh:
                    controller.refreshCalendar,
                child: ListView(
                  physics:
                      const AlwaysScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.fromLTRB(
                    18,
                    4,
                    18,
                    30,
                  ),
                  children: [
         Obx(
  () => ScanDateNavigationCard(
    selectedDate: controller.selectedDate.value,
    onPrevious: controller.previousDate,
    onNext: controller.nextDate,
    onDateTap: () {
      controller.pickDate(context);
    },
  ),
),
                    const SizedBox(height: 16),
                    const CalendarStatisticsSection(),
                    const SizedBox(height: 17),
                    _buildCalendarContent(),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

Widget _buildCalendarContent() {
  final calendar =
      controller.calendar.value;

  if (calendar == null) {
    return const SizedBox.shrink();
  }

  if (calendar.days.isEmpty) {
    return const EmptyStateCard(
      title: 'لا توجد بيانات لهذا الشهر',
      subtitle:
          'لا توجد طلبات أو حجوزات مسح مسجلة.',
      icon: Icons.calendar_month_outlined,
    );
  }

  return const MonthlyCalendarGrid();
}
}