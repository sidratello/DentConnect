import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/scan_booking_model.dart';
import '../repositry/scan_slots_repo.dart';
import 'app_date_picker.dart';

enum BookedAppointmentsFilter {
  all,
  today,
}

class BookedScanAppointmentsController
    extends GetxController {
  final ScanSlotsRepo _repo;

  BookedScanAppointmentsController({
    ScanSlotsRepo? repo,
  }) : _repo = repo ?? ScanSlotsRepo();

  final isLoading = false.obs;

  final bookings = <ScanBookingModel>[].obs;

  final selectedDate = DateTime.now().obs;

  final selectedFilter =
      BookedAppointmentsFilter.all.obs;

  @override
  void onInit() {
    super.onInit();
    loadBookings();
  }

  Future<void> loadBookings() async {
    if (isLoading.value) {
      return;
    }

    isLoading.value = true;

    try {
      final response =
          await _repo.getBookings();

      if (!response.success ||
          response.data == null) {
        Get.snackbar(
          'خطأ',
          response.message.isNotEmpty
              ? response.message
              : 'تعذر تحميل المواعيد المحجوزة',
          snackPosition: SnackPosition.BOTTOM,
        );

        return;
      }

      bookings.assignAll(
        response.data!,
      );

      _selectFirstBookingDate();
    } catch (_) {
      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء تحميل المواعيد المحجوزة',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  List<DateTime> get availableDates {
    final dates = <DateTime>[];

    for (final booking in bookings) {
      final date = booking.date;

      if (date == null) {
        continue;
      }

      final normalizedDate =
          _normalizeDate(date);

      final exists = dates.any(
        (item) => isSameDate(
          item,
          normalizedDate,
        ),
      );

      if (!exists) {
        dates.add(normalizedDate);
      }
    }

    dates.sort();

    return dates;
  }

  List<ScanBookingModel>
      get bookingsForSelectedDate {
    final result = bookings.where(
      (booking) {
        return isSameDate(
          booking.date,
          selectedDate.value,
        );
      },
    ).toList();

    result.sort(_compareBookingsByTime);

    return result;
  }

  List<ScanBookingModel>
      get displayedBookings {
    switch (selectedFilter.value) {
      case BookedAppointmentsFilter.all:
        return bookingsForSelectedDate;

      case BookedAppointmentsFilter.today:
        final today = DateTime.now();

        final result = bookings.where(
          (booking) {
            return isSameDate(
              booking.date,
              today,
            );
          },
        ).toList();

        result.sort(
          _compareBookingsByTime,
        );

        return result;
    }
  }

  int get totalBookings {
    return bookings.length;
  }

  int get uniqueDentistsCount {
    return bookings
        .map(
          (booking) => booking.dentistId,
        )
        .toSet()
        .length;
  }

  void changeFilter(
    BookedAppointmentsFilter filter,
  ) {
    selectedFilter.value = filter;

    if (filter ==
        BookedAppointmentsFilter.today) {
      selectedDate.value =
          _normalizeDate(DateTime.now());
    }
  }

  void previousDate() {
    final dates = availableDates;

    if (dates.isEmpty) {
      return;
    }

    final currentIndex =
        dates.indexWhere(
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

    final currentIndex =
        dates.indexWhere(
      (date) => isSameDate(
        date,
        selectedDate.value,
      ),
    );

    if (currentIndex >= 0 &&
        currentIndex <
            dates.length - 1) {
      selectedDate.value =
          dates[currentIndex + 1];
    }
  }

  Future<void> pickDate(
    BuildContext context,
  ) async {
    final selected =
        await AppDatePicker.select(
      context,
      currentDate: selectedDate.value,
      helpText: 'اختيار تاريخ الحجوزات',
      confirmText: 'اختيار',
    );

    if (selected == null) {
      return;
    }

    selectedDate.value =
        _normalizeDate(selected);

    selectedFilter.value =
        BookedAppointmentsFilter.all;
  }

  void _selectFirstBookingDate() {
    if (bookings.isEmpty) {
      return;
    }

    final dates = availableDates;

    if (dates.isEmpty) {
      return;
    }

    final currentDateExists = dates.any(
      (date) => isSameDate(
        date,
        selectedDate.value,
      ),
    );

    if (!currentDateExists) {
      selectedDate.value =
          dates.first;
    }
  }

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

  DateTime _normalizeDate(
    DateTime date,
  ) {
    return DateTime(
      date.year,
      date.month,
      date.day,
    );
  }

  int _compareBookingsByTime(
    ScanBookingModel first,
    ScanBookingModel second,
  ) {
    return _minutesFromBooking(first)
        .compareTo(
      _minutesFromBooking(second),
    );
  }

  int _minutesFromBooking(
    ScanBookingModel booking,
  ) {
    final parts =
        booking.time.split(':');

    if (parts.length < 2) {
      return 0;
    }

    final hour =
        int.tryParse(parts[0]) ?? 0;

    final minute =
        int.tryParse(parts[1]) ?? 0;

    return hour * 60 + minute;
  }
}