import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/app_button.dart';
import 'package:template/lab/features/add_scan_slot/views/booking_details_dialog/booking_appointment_section.dart';
import 'package:template/lab/features/add_scan_slot/views/booking_details_dialog/booking_clinic_section.dart';
import 'package:template/lab/features/add_scan_slot/views/booking_details_dialog/booking_details_card.dart';
import 'package:template/lab/features/add_scan_slot/views/booking_details_dialog/booking_details_row.dart';
import 'package:template/lab/features/add_scan_slot/views/booking_details_dialog/booking_dialog_header.dart';
import 'package:template/lab/features/add_scan_slot/views/booking_details_dialog/booking_row_divider.dart';
import 'package:template/lab/features/monthly_calendar/model/calendar_day_details_model.dart';

class CalendarScanVisitDetailsDialog {
  const CalendarScanVisitDetailsDialog._();

  static Future<void> show({
    required BuildContext context,
    required DateTime date,
    required CalendarScanVisitModel visit,
  }) {
    return Get.dialog<void>(
      Directionality(
        textDirection: TextDirection.rtl,
        child: Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 24,
          ),
          backgroundColor: Colors.transparent,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 500,
              maxHeight: 650,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BookingDialogHeader(
                    onClose: Get.back,
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(
                        18,
                        18,
                        18,
                        20,
                      ),
                      child: Column(
                        children: [
                   BookingAppointmentSection(
  date: date,
  timeFormatted: visit.formattedTime,
  period: visit.period,
),
                          const SizedBox(height: 16),
                      BookingDetailsCard(
      title: 'معلومات الطبيب',
      icon: Icons.person_outline_rounded,
      children: [
        BookingDetailsRow(
          icon: Icons.badge_outlined,
          label: 'اسم الطبيب',
          value: visit.doctorName,
        ),
        const BookingRowDivider(),

                         BookingDetailsRow(
          icon: Icons.phone_outlined,
          label: 'رقم الهاتف',
          value: visit.doctorPhone,
          valueTextDirection:
              TextDirection.rtl,
        ),
               const SizedBox(height: 16),
      ],
                      ),
                             const SizedBox(height: 16),
                   BookingClinicSection(
  clinicName: visit.doctorNamePlace,
  clinicAddress: visit.doctorAddressPlace,
  clinicCity: visit.doctorCityPlace,
  clinicCountry: visit.doctorCountryPlace,
),
                          const SizedBox(height: 22),
                          AppButton(
                            title: 'إغلاق',
                            onTap: Get.back,
                            type: AppButtonType.filled,
                            height: 46,
                            borderRadius: 12,
                            backgroundColor:
                                AppColors.primaryBlue,
                            textColor: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
}







