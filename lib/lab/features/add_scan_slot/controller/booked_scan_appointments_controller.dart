import 'package:get/get.dart';
import 'package:template/lab/shared/controller/date_navigation_mixin.dart';

import '../model/scan_booking_model.dart';
import '../repositry/scan_slots_repo.dart';


enum BookedAppointmentsFilter {
  all,
  today,
}

class BookedScanAppointmentsController
    extends GetxController with DateNavigationMixin {
  final ScanSlotsRepo _repo;

  BookedScanAppointmentsController({
    ScanSlotsRepo? repo,
  }) : _repo = repo ?? ScanSlotsRepo();

  final isLoading = false.obs;

  final bookings = <ScanBookingModel>[].obs;

@override
  final selectedDate = DateTime.now().obs;

  final selectedFilter =
      BookedAppointmentsFilter.all.obs;



  @override
  void onInit() {
    super.onInit();
    loadBookings();
  }

      @override
String get datePickerHelpText {
  return 'اختيار تاريخ الحجوزات';
}
@override
Future<void> onSelectedDateChanged(
  DateTime date,
) {
  selectedFilter.value =
      BookedAppointmentsFilter.all;

  return Future.value();
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

@override
  List<DateTime> get availableDates {
    final dates = <DateTime>[];

    for (final booking in bookings) {
      final date = booking.date;

      if (date == null) {
        continue;
      }

      final normalizedDate =
          normalizeDate(date);

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
        normalizeDate(DateTime.now());
  }
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