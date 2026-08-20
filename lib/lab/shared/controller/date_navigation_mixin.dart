import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/lab/features/add_scan_slot/controller/app_date_picker.dart';

mixin DateNavigationMixin on GetxController {
  /// كل Controller يجب أن يمتلك التاريخ المختار الخاص به.
  Rx<DateTime> get selectedDate;

  /// كل Controller يحدد التواريخ المتوفرة من بياناته.
  List<DateTime> get availableDates;

  /// النص الظاهر داخل Date Picker.
  String get datePickerHelpText {
    return 'اختيار التاريخ';
  }

  String get datePickerConfirmText {
    return 'اختيار';
  }

Future<void> previousDate() async {
  final dates = availableDates;

  if (dates.isEmpty) {
    return;
  }

  final currentIndex = dates.indexWhere(
    (date) => isSameDate(
      date,
      selectedDate.value,
    ),
  );

  if (currentIndex == -1) {
    await setSelectedDate(
      dates.last,
    );

    return;
  }

  if (currentIndex <= 0) {
    return;
  }

  await setSelectedDate(
    dates[currentIndex - 1],
  );
}

Future<void> nextDate() async {
  final dates = availableDates;

  if (dates.isEmpty) {
    return;
  }

  final currentIndex = dates.indexWhere(
    (date) => isSameDate(
      date,
      selectedDate.value,
    ),
  );

  if (currentIndex == -1) {
    await setSelectedDate(
      dates.first,
    );

    return;
  }

  if (currentIndex >= dates.length - 1) {
    return;
  }

  await setSelectedDate(
    dates[currentIndex + 1],
  );
}

  Future<void> pickDate(
    BuildContext context,
  ) async {
    final pickedDate =
        await AppDatePicker.select(
      context,
      currentDate: selectedDate.value,
      helpText: datePickerHelpText,
      confirmText: datePickerConfirmText,
    );

    if (pickedDate == null) {
      return;
    }

   await  setSelectedDate(pickedDate);
  }

Future<void> setSelectedDate(
  DateTime date,
) async {
  final normalizedDate =
      normalizeDate(date);

  selectedDate.value =
      normalizedDate;

  await onSelectedDateChanged(
    normalizedDate,
  );
}

  /// تستعملها الشاشة التي تحتاج عملاً إضافياً
  /// بعد تغيير التاريخ.
  Future<void> onSelectedDateChanged(
    DateTime date,
  ) async {}

  bool isSameDate(
    DateTime? first,
    DateTime? second,
  ) {
    if (first == null ||
        second == null) {
      return false;
    }

    return first.year == second.year &&
        first.month == second.month &&
        first.day == second.day;
  }

  DateTime normalizeDate(
    DateTime date,
  ) {
    return DateTime(
      date.year,
      date.month,
      date.day,
    );
  }
}