import 'package:flutter/material.dart';
import 'package:template/lab/features/add_scan_slot/views/wedjet_scan_slots/scan_slots_body.dart';
import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';


class ScanSlotsScreen extends StatelessWidget {
  const ScanSlotsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LabBackgroundLayout(
      child: SafeArea(
        child: ScanSlotsBody(),
      ),
    );
  }
}