import 'package:flutter/material.dart';
import 'package:template/lab/features/add_scan_slot/views/wedjet_add_scan_slot/add_scan_slot_body.dart';
import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';

class AddScanSlotScreen extends StatelessWidget {
  const AddScanSlotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LabBackgroundLayout(
      child: AddScanSlotBody(),
    );
  }
}