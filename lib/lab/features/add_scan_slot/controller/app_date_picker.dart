import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:template/core/app_colors.dart';

class AppDatePicker {
  AppDatePicker._();

  static Future<DateTime?> select(
    BuildContext context, {
    DateTime? currentDate,
    TextEditingController? textController,
    String helpText = 'اختر التاريخ',
    String confirmText = 'تأكيد التاريخ',
    String displayFormat = 'yyyy/MM/dd',
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final now = DateTime.now();

    final today = DateTime(
      now.year,
      now.month,
      now.day,
    );

    final pickerFirstDate = firstDate ?? today;

    final pickerLastDate =
        lastDate ??
        DateTime(
          now.year + 5,
          12,
          31,
        );

    DateTime pickerInitialDate = currentDate ?? today;

    // يجب أن يكون initialDate بين firstDate و lastDate.
    if (pickerInitialDate.isBefore(pickerFirstDate)) {
      pickerInitialDate = pickerFirstDate;
    }

    if (pickerInitialDate.isAfter(pickerLastDate)) {
      pickerInitialDate = pickerLastDate;
    }

    final pickedDate = await showDatePicker(
      context: context,
      locale: const Locale('ar'),
      initialDate: pickerInitialDate,
      firstDate: pickerFirstDate,
      lastDate: pickerLastDate,
      helpText: helpText,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
      cancelText: 'إلغاء',
      confirmText: confirmText,
      builder: (context, child) {
        return Localizations.override(
          context: context,
          locale: const Locale('ar'),
          child: Directionality(
            textDirection: ui.TextDirection.rtl,
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: AppColors.primaryBlue,
                ),
              ),
              child: child!,
            ),
          ),
        );
      },
    );

    if (pickedDate == null) {
      return null;
    }

    final normalizedDate = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
    );

    // يحدث حقل النص فقط عندما يتم تمرير TextEditingController.
    if (textController != null) {
      textController.text = DateFormat(
        displayFormat,
        'ar',
      ).format(normalizedDate);
    }

    return normalizedDate;
  }
}