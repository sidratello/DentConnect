import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/widgets/EmptyStateCard.dart';
import 'package:template/lab/features/add_scan_slot/views/booked_scan_appointments_wedjet/booked_card.dart';
import 'package:template/lab/features/add_scan_slot/views/booked_scan_appointments_wedjet/booked_filter.dart';
import 'package:template/lab/features/add_scan_slot/views/booked_scan_appointments_wedjet/booked_header.dart';
import 'package:template/lab/features/add_scan_slot/views/booked_scan_appointments_wedjet/booked_note.dart';
import 'package:template/lab/features/add_scan_slot/views/booked_scan_appointments_wedjet/booked_statistics.dart';

import '../../../../../../core/app_colors.dart';
import '../../controller/booked_scan_appointments_controller.dart';
import '../booking_details_dialog/scan_booking_details_dialog.dart';
import '../wedjet_scan_slots/scan_date_navigation_card.dart';


class BookedScanAppointmentsBody
    extends GetView<
        BookedScanAppointmentsController> {
  const BookedScanAppointmentsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Obx(
        () {
          if (controller.isLoading.value &&
              controller.bookings.isEmpty) {
            return const Center(
              child:
                  CircularProgressIndicator(
                color:
                    AppColors.primaryBlue,
              ),
            );
          }

          return RefreshIndicator(
            color: AppColors.primaryBlue,
            onRefresh:
                controller.loadBookings,
            child: ListView(
              physics:
                  const AlwaysScrollableScrollPhysics(),
              padding:
                  const EdgeInsets.fromLTRB(
                16,
                12,
                16,
                24,
              ),
              children: [
                const BookedAppointmentsHeader(),
             
                ScanDateNavigationCard(
                  selectedDate:
                      controller
                          .selectedDate.value,
                  onPrevious:
                      controller.previousDate,
                  onNext:
                      controller.nextDate,
                  onDateTap: () {
                    controller.pickDate(
                      context,
                    );
                  },
                ),
                const SizedBox(height: 18),
                const BookedAppointmentsStatistics(),
                const SizedBox(height: 18),
                const BookedAppointmentsFilterBar(),
                const SizedBox(height: 18),
                if (controller
                    .displayedBookings
                    .isEmpty)
               EmptyStateCard(
  title: 'لا توجد مواعيد محجوزة',
  subtitle: 'لا توجد حجوزات في هذا التاريخ',
  showCard: false,
  padding: const EdgeInsets.symmetric(
    vertical: 50,
  ),
  iconContainerSize: 70,
  iconSize: 70,
  iconColor:
      AppColors.normalText.withOpacity(0.5),
  iconBackgroundColor: Colors.transparent,
)
                else
                  ...controller.displayedBookings
                      .map(
                    (booking) =>
                        BookedAppointmentCard(
                      booking: booking,
                      onTap: () {
                        ScanBookingDetailsDialog
                            .show(
                          context: context,
                          booking: booking,
                        );
                      },
                    ),
                  ),
                const SizedBox(height: 4),
                const BookedAppointmentsNote(),
              ],
            ),
          );
        },
      ),
    );
  }
}