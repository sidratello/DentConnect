import 'package:flutter/material.dart';
import 'package:template/lab/features/add_scan_slot/views/wedjet_update_scan/update_scan_slot_body.dart';

import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';


class UpdateScanSlotScreen
    extends StatelessWidget {
  const UpdateScanSlotScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const LabBackgroundLayout(
      child: UpdateScanSlotBody(),
    );
  }
}