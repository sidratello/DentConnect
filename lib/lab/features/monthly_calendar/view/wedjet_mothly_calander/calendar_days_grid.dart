import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_router.dart';

import 'package:template/lab/features/monthly_calendar/controller/monthly_calendar_controller.dart';
import 'package:template/lab/features/monthly_calendar/view/wedjet_mothly_calander/calendar_day_cell.dart';
import 'package:template/lab/features/monthly_calendar/view/wedjet_mothly_calander/calendar_month_cells_builder.dart';

class CalendarDaysGrid extends GetView<
    MonthlyCalendarController> {
  const CalendarDaysGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final visibleMonth =
            controller.visibleMonth.value;

        final selectedDate =
            controller.selectedDate.value;

        final cells =
            buildCalendarMonthCells(
          visibleMonth,
        );

        return GridView.builder(
          shrinkWrap: true,
          physics:
              const NeverScrollableScrollPhysics(),
          itemCount: cells.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisExtent: 69,
            crossAxisSpacing: 1,
            mainAxisSpacing: 2,
          ),
          itemBuilder: (
            context,
            index,
          ) {
            final date = cells[index];

            if (date == null) {
              return const SizedBox.shrink();
            }

            final day =
                controller.dayForDate(
              date,
            );

            return CalendarDayCell(
              date: date,
              day: day,
              isSelected:
                  controller.isSameDate(
                date,
                selectedDate,
              ),
              isToday:
                  controller.isSameDate(
                date,
                DateTime.now(),
              ),
      onTap: () async {
  await controller.selectDate(
    date,
  );

  Get.toNamed(
    AppRouter.calendarDayDetails,
    arguments: {
      'date': date,
    },
  );
},
            );
          },
        );
      },
    );
  }
}