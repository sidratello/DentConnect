import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'app_date_picker.dart';
import 'app_time_picker.dart';

abstract class ScanSlotFormController
    extends GetxController {
  final selectedDate = Rxn<DateTime>();

  final selectedTime = Rxn<TimeOfDay>();

  final selectedPeriod = 'AM'.obs;

  final dateController =
      TextEditingController();

  final timeController =
      TextEditingController();

  final isLoading = false.obs;

  String get formattedDate {
    final date = selectedDate.value;

    if (date == null) {
      return '';
    }

    return DateFormat(
      'yyyy/MM/dd',
      'ar',
    ).format(date);
  }

  String get apiDate {
    final date = selectedDate.value;

    if (date == null) {
      return '';
    }

    return DateFormat(
      'yyyy-MM-dd',
    ).format(date);
  }

  String get formattedTime {
    final time = selectedTime.value;

    if (time == null) {
      return '';
    }

    final hour = hourIn12Format(
      time.hour,
    );

    final minute = time.minute
        .toString()
        .padLeft(2, '0');

    return '${hour.toString().padLeft(2, '0')}:$minute';
  }

  String get apiTime => formattedTime;

  bool get isFormValid {
    return selectedDate.value != null &&
        selectedTime.value != null;
  }

  Future<void> selectDate(
    BuildContext context,
  ) async {
    final pickedDate =
        await AppDatePicker.select(
      context,
      currentDate: selectedDate.value,
      textController: dateController,
      helpText: 'اختر تاريخ الموعد',
      confirmText: 'تأكيد التاريخ',
    );

    if (pickedDate == null) {
      return;
    }

    selectedDate.value = pickedDate;
    dateController.text = formattedDate;
  }

  Future<void> selectTime(
    BuildContext context,
  ) async {
    final pickedTime =
        await AppTimePicker.select(
      context,
      currentTime: selectedTime.value,
      helpText: 'اختر الوقت',
      confirmText: 'تأكيد الوقت',
      cancelText: 'إلغاء',
    );

    if (pickedTime == null) {
      return;
    }

    selectedTime.value = pickedTime;

    selectedPeriod.value =
        pickedTime.period == DayPeriod.am
            ? 'AM'
            : 'PM';

    timeController.text = formattedTime;
  }

  void changePeriod(String period) {
    if (period != 'AM' &&
        period != 'PM') {
      return;
    }

    selectedPeriod.value = period;

    final oldTime = selectedTime.value;

    if (oldTime == null) {
      return;
    }

    int hour = oldTime.hour;

    if (period == 'AM' &&
        hour >= 12) {
      hour -= 12;
    } else if (period == 'PM' &&
        hour < 12) {
      hour += 12;
    }

    selectedTime.value = TimeOfDay(
      hour: hour,
      minute: oldTime.minute,
    );

    timeController.text = formattedTime;
  }

  bool validateForm() {
    if (selectedDate.value == null) {
      Get.snackbar(
        'تنبيه',
        'يرجى اختيار تاريخ الموعد',
        snackPosition:
            SnackPosition.BOTTOM,
      );

      return false;
    }

    if (selectedTime.value == null) {
      Get.snackbar(
        'تنبيه',
        'يرجى اختيار وقت الموعد',
        snackPosition:
            SnackPosition.BOTTOM,
      );

      return false;
    }

    return true;
  }

  int hourIn12Format(int hour) {
    if (hour == 0) {
      return 12;
    }

    if (hour > 12) {
      return hour - 12;
    }

    return hour;
  }

  @override
  void onClose() {
    dateController.dispose();
    timeController.dispose();

    super.onClose();
  }
}