import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/lab/features/add_scan_slot/controller/app_date_picker.dart';
import 'package:template/lab/features/add_scan_slot/repositry/scan_slots_repo.dart';

import '../model/scan_booking_model.dart';
import '../model/scan_slot_model.dart';

enum ScanSlotFilter {
  all,
  available,
  booked,
}

class ScanSlotsController extends GetxController {
  final ScanSlotsRepo _repo = ScanSlotsRepo();

  final isLoading = false.obs;
  final isDeleting = false.obs;

  final slots = <ScanSlotModel>[].obs;
  final bookings = <ScanBookingModel>[].obs;

  final bookingsCount = 0.obs;

  final selectedDate = DateTime.now().obs;

  final selectedFilter = ScanSlotFilter.all.obs;

  @override
  void onInit() {
    super.onInit();

    loadData();
  }

  Future<void> loadData() async {
    isLoading.value = true;

    try {
      final results = await Future.wait([
        _repo.getScanSlots(),
        _repo.getBookings(),
        _repo.getBookingsCount(),
      ]);

      final slotsResponse = results[0];
      final bookingsResponse = results[1];
      final countResponse = results[2];

      if (slotsResponse.success &&
          slotsResponse.data != null) {
        slots.assignAll(
          slotsResponse.data as List<ScanSlotModel>,
        );

        _selectFirstAvailableDate();
      }

      if (bookingsResponse.success &&
          bookingsResponse.data != null) {
        bookings.assignAll(
          bookingsResponse.data
              as List<ScanBookingModel>,
        );
      }

      if (countResponse.success &&
          countResponse.data != null) {
        bookingsCount.value =
            countResponse.data as int;
      }
    } catch (error) {
      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء تحميل مواعيد المسح',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void _selectFirstAvailableDate() {
    if (slots.isEmpty) {
      return;
    }

    final sortedSlots = [...slots]
      ..sort((firstSlot, secondSlot) {
        final firstDate =
            firstSlot.date ?? DateTime(2100);

        final secondDate =
            secondSlot.date ?? DateTime(2100);

        return firstDate.compareTo(secondDate);
      });

    final currentDateExists = sortedSlots.any(
      (slot) => isSameDate(
        slot.date,
        selectedDate.value,
      ),
    );

    if (!currentDateExists &&
        sortedSlots.first.date != null) {
      selectedDate.value =
          _normalizeDate(sortedSlots.first.date!);
    }
  }

  List<DateTime> get availableDates {
    final result = <DateTime>[];

    for (final slot in slots) {
      final date = slot.date;

      if (date == null) {
        continue;
      }

      final normalizedDate = _normalizeDate(date);

      final alreadyAdded = result.any(
        (item) => isSameDate(
          item,
          normalizedDate,
        ),
      );

      if (!alreadyAdded) {
        result.add(normalizedDate);
      }
    }

    result.sort();

    return result;
  }

  List<ScanSlotModel> get slotsForSelectedDate {
    final result = slots.where((slot) {
      return isSameDate(
        slot.date,
        selectedDate.value,
      );
    }).toList();

    result.sort(_compareSlotsByTime);

    return result;
  }

  List<ScanSlotModel> get filteredSlots {
    switch (selectedFilter.value) {
      case ScanSlotFilter.available:
        return slotsForSelectedDate
            .where((slot) => !slot.isBooked)
            .toList();

      case ScanSlotFilter.booked:
        return slotsForSelectedDate
            .where((slot) => slot.isBooked)
            .toList();

      case ScanSlotFilter.all:
        return slotsForSelectedDate;
    }
  }

  List<ScanSlotModel> get morningSlots {
    return filteredSlots
        .where(
          (slot) =>
              slot.period.toUpperCase() == 'AM',
        )
        .toList();
  }

  List<ScanSlotModel> get eveningSlots {
    return filteredSlots
        .where(
          (slot) =>
              slot.period.toUpperCase() == 'PM',
        )
        .toList();
  }

  int get totalCount {
    return slotsForSelectedDate.length;
  }

  int get availableCount {
    return slotsForSelectedDate
        .where((slot) => !slot.isBooked)
        .length;
  }

  int get bookedCount {
    return slotsForSelectedDate
        .where((slot) => slot.isBooked)
        .length;
  }

  void changeFilter(ScanSlotFilter filter) {
    selectedFilter.value = filter;
  }

  void previousDate() {
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

    if (currentIndex > 0) {
      selectedDate.value =
          dates[currentIndex - 1];
    }
  }

  void nextDate() {
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

    if (currentIndex >= 0 &&
        currentIndex < dates.length - 1) {
      selectedDate.value =
          dates[currentIndex + 1];
    }
  }

  Future<void> pickDate(
    BuildContext context,
  ) async {
    final pickedDate = await AppDatePicker.select(
      context,
      currentDate: selectedDate.value,
      helpText: 'اختيار تاريخ المواعيد',
      confirmText: 'اختيار',
    );

    if (pickedDate == null) {
      return;
    }

    selectedDate.value = pickedDate;
  }

  ScanBookingModel? bookingForSlot(int slotId) {
    final index = bookings.indexWhere(
      (booking) => booking.slotId == slotId,
    );

    if (index == -1) {
      return null;
    }

    return bookings[index];
  }

  Future<void> deleteSlot(
    ScanSlotModel slot,
  ) async {
    if (slot.isBooked) {
      Get.snackbar(
        'غير متاح',
        'لا يمكن حذف موعد محجوز',
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

    if (isDeleting.value) {
      return;
    }

    isDeleting.value = true;

    try {
      final response = await _repo.deleteScanSlot(
        slotId: slot.id,
      );

      if (!response.success) {
        Get.snackbar(
          'خطأ',
          response.message.isNotEmpty
              ? response.message
              : 'تعذر حذف الموعد',
          snackPosition: SnackPosition.BOTTOM,
        );

        return;
      }

      slots.removeWhere(
        (item) => item.id == slot.id,
      );

      if (Get.isDialogOpen == true ||
          Get.isBottomSheetOpen == true) {
        Get.back();
      }

      Get.snackbar(
        'تم الحذف',
        response.message.isNotEmpty
            ? response.message
            : 'تم حذف الموعد بنجاح',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (error) {
      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء حذف الموعد',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isDeleting.value = false;
    }
  }

  void replaceUpdatedSlot(
    ScanSlotModel updatedSlot,
  ) {
    final index = slots.indexWhere(
      (slot) => slot.id == updatedSlot.id,
    );

    if (index == -1) {
      slots.add(updatedSlot);
    } else {
      slots[index] = updatedSlot;
    }

    final updatedDate = updatedSlot.date;

    if (updatedDate != null) {
      selectedDate.value =
          _normalizeDate(updatedDate);
    }

    slots.refresh();
  }

  void addCreatedSlot(
    ScanSlotModel newSlot,
  ) {
    slots.add(newSlot);

    final newDate = newSlot.date;

    if (newDate != null) {
      selectedDate.value =
          _normalizeDate(newDate);
    }

    slots.refresh();
  }

  bool isSameDate(
    DateTime? first,
    DateTime? second,
  ) {
    if (first == null || second == null) {
      return false;
    }

    return first.year == second.year &&
        first.month == second.month &&
        first.day == second.day;
  }

  DateTime _normalizeDate(DateTime date) {
    return DateTime(
      date.year,
      date.month,
      date.day,
    );
  }

  int _compareSlotsByTime(
    ScanSlotModel first,
    ScanSlotModel second,
  ) {
    final firstMinutes = _slotMinutes(first);
    final secondMinutes = _slotMinutes(second);

    return firstMinutes.compareTo(
      secondMinutes,
    );
  }

  int _slotMinutes(ScanSlotModel slot) {
    final formattedTime =
        slot.timeFormatted.trim();

    final regularExpression = RegExp(
      r'(\d{1,2}):(\d{2})',
    );

    final match = regularExpression.firstMatch(
      formattedTime,
    );

    int hour = 0;
    int minute = 0;

    if (match != null) {
      hour =
          int.tryParse(match.group(1) ?? '') ?? 0;

      minute =
          int.tryParse(match.group(2) ?? '') ?? 0;
    } else {
      final parts = slot.time.split(':');

      if (parts.length >= 2) {
        hour = int.tryParse(parts[0]) ?? 0;
        minute = int.tryParse(parts[1]) ?? 0;
      }
    }

    final period = slot.period.toUpperCase();

    if (period == 'AM') {
      if (hour == 12) {
        hour = 0;
      }
    } else if (period == 'PM') {
      if (hour < 12) {
        hour += 12;
      }
    }

    return hour * 60 + minute;
  }
}