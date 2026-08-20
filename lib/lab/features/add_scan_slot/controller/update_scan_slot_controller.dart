import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/scan_slot_model.dart';
import '../repositry/scan_slots_repo.dart';
import 'scan_slot_form_controller.dart';

class UpdateScanSlotController
    extends ScanSlotFormController {
  final ScanSlotsRepo _repo =
      ScanSlotsRepo();

  ScanSlotModel? originalSlot;

  bool get hasChanges {
    final slot = originalSlot;
    final originalDate = slot?.date;
    final currentDate =
        selectedDate.value;

    if (slot == null ||
        originalDate == null ||
        currentDate == null) {
      return false;
    }

    final dateChanged =
        originalDate.year !=
            currentDate.year ||
        originalDate.month !=
            currentDate.month ||
        originalDate.day !=
            currentDate.day;

    final timeChanged =
        formattedTime !=
            extractTime(
              slot.timeFormatted,
            );

    final periodChanged =
        selectedPeriod.value !=
            slot.period.toUpperCase();

    return dateChanged ||
        timeChanged ||
        periodChanged;
  }

  @override
  void onInit() {
    super.onInit();

    final arguments = Get.arguments;

    if (arguments
        is! ScanSlotModel) {
      Get.snackbar(
        'خطأ',
        'بيانات الموعد غير متوفرة',
        snackPosition:
            SnackPosition.BOTTOM,
      );

      return;
    }

    originalSlot = arguments;

    initializeFromSlot(arguments);
  }

  void initializeFromSlot(
    ScanSlotModel slot,
  ) {
    selectedDate.value = slot.date;

    selectedPeriod.value =
        slot.period.toUpperCase() ==
                'PM'
            ? 'PM'
            : 'AM';

    selectedTime.value =
        parseSlotTime(slot);

    dateController.text =
        formattedDate;

    timeController.text =
        formattedTime;
  }

  TimeOfDay parseSlotTime(
    ScanSlotModel slot,
  ) {
    final timeText = extractTime(
      slot.timeFormatted,
    );

    final parts =
        timeText.split(':');

    int hour =
        int.tryParse(parts.first) ??
            9;

    final minute =
        parts.length > 1
            ? int.tryParse(
                    parts[1],
                  ) ??
                0
            : 0;

    final period =
        slot.period.toUpperCase();

    if (period == 'PM' &&
        hour < 12) {
      hour += 12;
    }

    if (period == 'AM' &&
        hour == 12) {
      hour = 0;
    }

    return TimeOfDay(
      hour: hour,
      minute: minute,
    );
  }

  String extractTime(String value) {
    final match = RegExp(
      r'\d{1,2}:\d{2}',
    ).firstMatch(value);

    return match?.group(0) ??
        value;
  }

  Future<void> updateScanSlot() async {
    if (!validateForm()) {
      return;
    }

    final slot = originalSlot;

    if (slot == null) {
      Get.snackbar(
        'خطأ',
        'بيانات الموعد غير متوفرة',
        snackPosition:
            SnackPosition.BOTTOM,
      );

      return;
    }

    if (!hasChanges) {
      Get.snackbar(
        'تنبيه',
        'لم يتم إجراء أي تعديل',
        snackPosition:
            SnackPosition.BOTTOM,
      );

      return;
    }

    if (isLoading.value) {
      return;
    }

    isLoading.value = true;

    try {
      final response =
          await _repo.updateScanSlot(
        slotId: slot.id,
        date: apiDate,
        time: apiTime,
        period: selectedPeriod.value,
      );

      if (!response.success ||
          response.data == null) {
        Get.snackbar(
          'خطأ',
          response.message.isNotEmpty
              ? response.message
              : 'تعذر تعديل موعد المسح',
          snackPosition:
              SnackPosition.BOTTOM,
        );

        return;
      }

      Get.back(
        result: {
          'success': true,
          'message':
              response.message.isEmpty
                  ? 'تم تعديل موعد المسح بنجاح'
                  : response.message,
          'slot': response.data,
        },
      );
    } catch (error) {
      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء تعديل موعد المسح',
        snackPosition:
            SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}