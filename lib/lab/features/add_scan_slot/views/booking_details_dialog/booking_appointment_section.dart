import 'package:flutter/material.dart';

import 'booking_details_card.dart';
import 'booking_details_formatter.dart';
import 'booking_details_row.dart';
import 'booking_row_divider.dart';
class BookingAppointmentSection extends StatelessWidget {
  final DateTime? date;
  final String timeFormatted;
  final String period;

  const BookingAppointmentSection({
    super.key,
    required this.date,
    required this.timeFormatted,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    final isMorning =
        period.toUpperCase() == 'AM';

    return BookingDetailsCard(
      title: 'معلومات الموعد',
      icon: Icons.schedule_outlined,
      children: [
        BookingDetailsRow(
          icon: Icons.calendar_today_outlined,
          label: 'التاريخ',
          value: BookingDetailsFormatter.date(
            date,
          ),
        ),
        const BookingRowDivider(),
        BookingDetailsRow(
          icon: Icons.access_time_rounded,
          label: 'الوقت',
          value: timeFormatted,
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
            period,
          ),
        ),
      ],
    );
  }
}