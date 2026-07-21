import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/app_button.dart';

import 'package:template/lab/features/add_scan_slot/views/booking_details_dialog/booking_appointment_section.dart';
import 'package:template/lab/features/add_scan_slot/views/booking_details_dialog/booking_clinic_section.dart';
import 'package:template/lab/features/add_scan_slot/views/booking_details_dialog/booking_dentist_section.dart';
import 'package:template/lab/features/add_scan_slot/views/booking_details_dialog/booking_dialog_header.dart';
import 'package:template/lab/features/case_order_details/views/widget/details_section_card.dart';

import '../../model/scan_booking_model.dart';

class ScanBookingDetailsDialog {
  const ScanBookingDetailsDialog._();

  static Future<void> show({
    required BuildContext context,
    required ScanBookingModel booking,
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
              maxHeight: 700,
            ),
            child: DetailsSectionCard(
              padding: EdgeInsets.zero,
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
                            booking: booking,
                          ),
                          const SizedBox(height: 16),
                          BookingDentistSection(
                            booking: booking,
                          ),
                          const SizedBox(height: 16),
                          BookingClinicSection(
                            booking: booking,
                          ),
                          const SizedBox(height: 22),
                          AppButton(
                            title: 'إغلاق',
                            onTap: Get.back,
                            type:
                                AppButtonType.filled,
                            height: 46,
                            borderRadius: 12,
                            backgroundColor:
                                AppColors.primaryBlue,
                            textColor:
                                AppColors.white,
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