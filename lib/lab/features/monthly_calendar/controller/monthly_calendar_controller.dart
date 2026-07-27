import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/lab/features/monthly_calendar/model/monthly_calendar_model.dart';

import 'package:template/lab/features/monthly_calendar/repository/monthly_calendar_repository.dart';
import 'package:template/lab/shared/controller/date_navigation_mixin.dart';

class MonthlyCalendarController
    extends GetxController with DateNavigationMixin{
  final MonthlyCalendarRepository repository;

  MonthlyCalendarController({
    required this.repository,
  });

  final isLoading = false.obs;
  final isRefreshing = false.obs;

  final calendar =
      Rxn<MonthlyCalendarModel>();

  final visibleMonth = DateTime(
    DateTime.now().year,
    DateTime.now().month,
  ).obs;

@override
  final selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  ).obs;
@override
String get datePickerHelpText {
  return 'اختيار تاريخ الطلبات';
}
  @override
  void onInit() {
    super.onInit();

    fetchCalendar();
  }

  Future<void> fetchCalendar({
    bool showLoading = true,
     bool updateSelectedDate = true,
  }) async {
    if (isLoading.value) {
      return;
    }

    if (showLoading) {
      isLoading.value = true;
    }

    try {
      final month = visibleMonth.value;

      final response =
          await repository.getMonthlyCalendar(
        year: month.year,
        month: month.month,
      );


      if (!response.success ||
          response.data == null) {
        _showError(
          response.message.isNotEmpty
              ? response.message
              : 'تعذر تحميل التقويم الشهري.',
        );

        return;
      }

      calendar.value = response.data;

    if (updateSelectedDate) {
    _updateSelectedDate();
  }
    } catch (_) {
      _showError(
        'حدث خطأ أثناء تحميل التقويم الشهري.',
      );
    } finally {
      isLoading.value = false;
      isRefreshing.value = false;
    }
  }

  Future<void> refreshCalendar() async {
    isRefreshing.value = true;

    await fetchCalendar(
      showLoading: false,
    );
  }




@override
Future<void> nextDate() async {
  if (isLoading.value) {
    return;
  }

  final currentDate =
      normalizeDate(selectedDate.value);

  final datesInCurrentMonth = availableDates
      .where(
        (date) => date.isAfter(currentDate),
      )
      .toList()
    ..sort();

  if (datesInCurrentMonth.isNotEmpty) {
    await setSelectedDate(
      datesInCurrentMonth.first,
    );

    return;
  }

  await _findDateInAnotherMonth(
    direction: 1,
  );
}


@override
Future<void> previousDate() async {
  if (isLoading.value) {
    return;
  }

  final currentDate =
      normalizeDate(selectedDate.value);

  final datesInCurrentMonth = availableDates
      .where(
        (date) => date.isBefore(currentDate),
      )
      .toList()
    ..sort();

  if (datesInCurrentMonth.isNotEmpty) {
    await setSelectedDate(
      datesInCurrentMonth.last,
    );

    return;
  }

  await _findDateInAnotherMonth(
    direction: -1,
  );
}


Future<void> _findDateInAnotherMonth({
  required int direction,
}) async {
  if (isLoading.value) {
    return;
  }

  isLoading.value = true;

  try {
    for (int offset = 1; offset <= 24; offset++) {
      final targetMonth = DateTime(
        visibleMonth.value.year,
        visibleMonth.value.month +
            (offset * direction),
        1,
      );

      final response =
          await repository.getMonthlyCalendar(
        year: targetMonth.year,
        month: targetMonth.month,
      );

      if (!response.success ||
          response.data == null) {
        continue;
      }

      final loadedCalendar =
          response.data!;

      final dates = loadedCalendar.days
          .where(
            (day) => day.hasData,
          )
          .map(
            (day) => normalizeDate(
              day.date,
            ),
          )
          .toList()
        ..sort();

      if (dates.isEmpty) {
        continue;
      }

      visibleMonth.value = DateTime(
        loadedCalendar.year,
        loadedCalendar.month,
        1,
      );

      calendar.value =
          loadedCalendar;

      selectedDate.value =
          direction == 1
              ? dates.first
              : dates.last;

      return;
    }

    Get.snackbar(
      'لا توجد بيانات',
      direction == 1
          ? 'لا توجد طلبات أو حجوزات لاحقة.'
          : 'لا توجد طلبات أو حجوزات سابقة.',
      snackPosition: SnackPosition.BOTTOM,
    );
  } finally {
    isLoading.value = false;
  }
}




  Future<void> previousMonth() async {
    final current = visibleMonth.value;

    visibleMonth.value = DateTime(
      current.year,
      current.month - 1,
      1,
    );

    calendar.value = null;

    await fetchCalendar();
  }

  Future<void> nextMonth() async {
    final current = visibleMonth.value;

    visibleMonth.value = DateTime(
      current.year,
      current.month + 1,
      1,
    );

    calendar.value = null;

    await fetchCalendar();
  }

Future<void> selectDate(
  DateTime date,
) async {
  await setSelectedDate(date);

  final day = dayForDate(date);

  if (day == null ||
      !day.hasData) {
    return;
  }

  // فتح التفاصيل لاحقاً
}



@override
Future<void> onSelectedDateChanged(
  DateTime date,
) async {
  final currentMonth =
      visibleMonth.value;

  final changedMonth =
      currentMonth.year != date.year ||
      currentMonth.month != date.month;

  if (!changedMonth) {
    return;
  }

  visibleMonth.value = DateTime(
    date.year,
    date.month,
    1,
  );

  calendar.value = null;

  await fetchCalendar(
    updateSelectedDate: false,
  );
}
  CalendarDayModel? dayForDate(
    DateTime date,
  ) {
    final days = calendar.value?.days;

    if (days == null || days.isEmpty) {
      return null;
    }

    for (final day in days) {
      if (isSameDate(day.date, date)) {
        return day;
      }
    }

    return null;
  }

  Map<String, CalendarDayModel>
      get calendarDaysMap {
    final days = calendar.value?.days ?? [];

    return {
      for (final day in days)
        dateKey(day.date): day,
    };
  }

  int get totalOrders {
    return calendar.value?.totalOrders ?? 0;
  }

  int get totalScanVisits {
    return calendar.value?.totalScanVisits ??
        0;
  }

@override
List<DateTime> get availableDates {
  final days = calendar.value?.days ?? [];

  final result = days
      .where(
        (day) =>
            day.ordersCount > 0 ||
            day.scanVisitsCount > 0,
      )
      .map(
        (day) => normalizeDate(
          day.date,
        ),
      )
      .toList();

  result.sort();

  return result;
}



  String dateKey(
    DateTime date,
  ) {
    return '${date.year.toString().padLeft(4, '0')}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2, '0')}';
  }

void _updateSelectedDate() {
  final current = selectedDate.value;
  final month = visibleMonth.value;

  final selectedInsideMonth =
      current.year == month.year &&
      current.month == month.month;

  if (selectedInsideMonth) {
    return;
  }

  selectedDate.value = DateTime(
    month.year,
    month.month,
    1,
  );
}

  void _showError(
    String message,
  ) {
    Get.snackbar(
      'حدث خطأ',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor:
          Colors.red.shade50,
      colorText: Colors.red.shade800,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      icon: const Icon(
        Icons.error_outline_rounded,
        color: Colors.red,
      ),
    );
  }
}