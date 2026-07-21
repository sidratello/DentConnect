import 'package:flutter/material.dart';

import '../../model/scan_booking_model.dart';
import 'booking_details_card.dart';
import 'booking_details_row.dart';
import 'booking_row_divider.dart';

class BookingClinicSection
    extends StatelessWidget {
  final ScanBookingModel booking;

  const BookingClinicSection({
    super.key,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    return BookingDetailsCard(
      title: 'معلومات العيادة',
      icon: Icons.local_hospital_outlined,
      children: [
        BookingDetailsRow(
          icon: Icons.business_outlined,
          label: 'اسم العيادة',
          value: booking.clinicName,
        ),
        const BookingRowDivider(),
        BookingDetailsRow(
          icon: Icons.location_on_outlined,
          label: 'العنوان',
          value: _buildFullAddress(),
        ),
      ],
    );
  }

  String _buildFullAddress() {
    final addressParts = [
      booking.clinicAddress,
      booking.clinicCity,
      booking.clinicCountry,
    ];

    return addressParts
        .where(
          (value) =>
              value.trim().isNotEmpty,
        )
        .join(' - ');
  }
}