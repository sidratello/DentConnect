import 'package:flutter/material.dart';

import '../../model/scan_booking_model.dart';
import 'booking_details_card.dart';
import 'booking_details_formatter.dart';
import 'booking_details_row.dart';
import 'booking_row_divider.dart';

class BookingAppointmentSection
    extends StatelessWidget {
  final ScanBookingModel booking;

  const BookingAppointmentSection({
    super.key,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    final isMorning =
        booking.period.toUpperCase() == 'AM';

    return BookingDetailsCard(
      title: 'معلومات الموعد',
      icon: Icons.schedule_outlined,
      children: [
        BookingDetailsRow(
          icon: Icons.calendar_today_outlined,
          label: 'التاريخ',
          value: BookingDetailsFormatter.date(
            booking.date,
          ),
        ),
        const BookingRowDivider(),
        BookingDetailsRow(
          icon: Icons.access_time_rounded,
          label: 'الوقت',
          value: booking.timeFormatted,
          valueTextDirection:
              TextDirection.rtl,
        ),
        const BookingRowDivider(),
        BookingDetailsRow(
          icon: isMorning
              ? Icons.wb_sunny_outlined
              : Icons.nightlight_outlined,
          label: 'الفترة',
          value: BookingDetailsFormatter.period(
            booking.period,
          ),
        ),
      ],
    );
  }
}