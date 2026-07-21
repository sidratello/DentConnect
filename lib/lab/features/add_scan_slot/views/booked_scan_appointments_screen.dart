import 'package:flutter/material.dart';
import 'package:template/lab/features/add_scan_slot/views/booked_scan_appointments_wedjet/booked_body.dart';

import '../../../../../../core/app_colors.dart';

class BookedScanAppointmentsScreen
    extends StatelessWidget {
  const BookedScanAppointmentsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:
          AppColors.background,
      body: SafeArea(
        child:
            BookedScanAppointmentsBody(),
      ),
    );
  }
}