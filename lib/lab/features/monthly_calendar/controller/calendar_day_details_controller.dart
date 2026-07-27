import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/lab/features/monthly_calendar/model/calendar_day_details_model.dart';
import 'package:template/lab/features/monthly_calendar/repository/monthly_calendar_repository.dart';
import 'package:template/lab/shared/models/lab_order_model.dart';

class CalendarDayDetailsController
    extends GetxController {
  final MonthlyCalendarRepository repository;

  CalendarDayDetailsController({
    required this.repository,
  });

  final isLoading = false.obs;

  final details =
      Rxn<CalendarDayDetailsModel>();

  late final DateTime selectedDate;

  int get totalOrders =>
      visibleOrders.length;

  int get totalScanVisits =>
      details.value?.scanVisits.length ??
      0;

  List<CalendarScanVisitModel>
      get scanVisits =>
          details.value?.scanVisits ??
          const [];
List<LabOrderModel> get visibleOrders {
  final orders =
      details.value?.orders ??
      <LabOrderModel>[];

  return orders.where(
    (order) {
      final status = order.status
          .trim()
          .toLowerCase();

      return status != 'pennding';
    },
  ).toList();
}

  bool get isEmpty =>
      visibleOrders.isEmpty &&
      scanVisits.isEmpty;

  @override
  void onInit() {
    super.onInit();

    selectedDate =
        _readSelectedDate();

    fetchDayDetails();
  }

  Future<void> fetchDayDetails() async {
    if (isLoading.value) {
      return;
    }

    try {
      isLoading.value = true;

      final response =
          await repository
              .getCalendarDayDetails(
        date: selectedDate,
      );

      if (!response.success ||
          response.data == null) {
        _showError(
          response.message ??
              'تعذر تحميل تفاصيل اليوم.',
        );

        return;
      }

      details.value = response.data;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshDayDetails() {
    return fetchDayDetails();
  }

  DateTime _readSelectedDate() {
    final arguments = Get.arguments;

    if (arguments is DateTime) {
      return _normalizeDate(arguments);
    }

    if (arguments is Map) {
      final date = arguments['date'];

      if (date is DateTime) {
        return _normalizeDate(date);
      }

      if (date is String) {
        final parsedDate =
            DateTime.tryParse(date);

        if (parsedDate != null) {
          return _normalizeDate(
            parsedDate,
          );
        }
      }
    }

    return _normalizeDate(
      DateTime.now(),
    );
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

  void _showError(String message) {
    Get.snackbar(
      'حدث خطأ',
      message,
      snackPosition:
          SnackPosition.BOTTOM,
      backgroundColor:
          AppColors.red.withOpacity(.9),
      colorText: AppColors.white,
      margin:
          const EdgeInsets.all(16),
    );
  }
}