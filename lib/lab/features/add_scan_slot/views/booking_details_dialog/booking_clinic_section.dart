import 'package:flutter/material.dart';

import 'booking_details_card.dart';
import 'booking_details_row.dart';
import 'booking_row_divider.dart';

class BookingClinicSection extends StatelessWidget {
  final String clinicName;
  final String clinicAddress;
  final String clinicCity;
  final String clinicCountry;

  const BookingClinicSection({
    super.key,
    required this.clinicName,
    required this.clinicAddress,
    required this.clinicCity,
    required this.clinicCountry,
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
          value: clinicName,
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
    return [
      clinicAddress,
      clinicCity,
      clinicCountry,
    ]
        .where((value) => value.trim().isNotEmpty)
        .join(' - ');
  }
}