import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';

class AppTimePicker {
  AppTimePicker._();

  static Future<TimeOfDay?> select(
    BuildContext context, {
    TimeOfDay? currentTime,
    String helpText = 'اختر الوقت',
    String confirmText = 'تأكيد الوقت',
    String cancelText = 'إلغاء',
  }) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime:
          currentTime ??
          const TimeOfDay(
            hour: 9,
            minute: 30,
          ),
      helpText: helpText,
      cancelText: cancelText,
      confirmText: confirmText,
      builder: (context, child) {
        return Localizations.override(
          context: context,
          locale: const Locale('ar'),
          child: Directionality(
            textDirection: ui.TextDirection.rtl,
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                alwaysUse24HourFormat: false,
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: AppColors.primaryBlue,
                  ),
                ),
                child: child!,
              ),
            ),
          ),
        );
      },
    );

    return pickedTime;
  }
}