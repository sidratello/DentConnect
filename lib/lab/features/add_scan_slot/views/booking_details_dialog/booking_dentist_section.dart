import 'package:flutter/material.dart';

import '../../model/scan_booking_model.dart';
import 'booking_details_card.dart';
import 'booking_details_row.dart';
import 'booking_row_divider.dart';

class BookingDentistSection
    extends StatelessWidget {
  final ScanBookingModel booking;

  const BookingDentistSection({
    super.key,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    return BookingDetailsCard(
      title: 'معلومات الطبيب',
      icon: Icons.person_outline_rounded,
      children: [
        BookingDetailsRow(
          icon: Icons.badge_outlined,
          label: 'اسم الطبيب',
          value: booking.dentistName,
        ),
        const BookingRowDivider(),
        BookingDetailsRow(
          icon: Icons.email_outlined,
          label: 'البريد الإلكتروني',
          value: booking.dentistEmail,
          valueTextDirection:
              TextDirection.rtl,
        ),
        const BookingRowDivider(),
        BookingDetailsRow(
          icon: Icons.phone_outlined,
          label: 'رقم الهاتف',
          value: booking.dentistPhone,
          valueTextDirection:
              TextDirection.rtl,
        ),
      ],
    );
  }
}