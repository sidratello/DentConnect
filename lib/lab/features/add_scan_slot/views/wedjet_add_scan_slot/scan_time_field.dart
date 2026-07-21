import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/input_textfield.dart';
import 'package:template/lab/features/add_scan_slot/controller/scan_slot_form_controller.dart';


class ScanTimeField extends StatelessWidget {
    final ScanSlotFormController controller;
  const ScanTimeField({super.key,    required this.controller,});

  @override
  Widget build(BuildContext context) {
 

    return AuthInputField(
      title: 'الوقت',
      hintText: 'اختر الوقت',
      controller: controller.timeController,
      readOnly: true,
      fillColor: AppColors.white,
      borderColor: AppColors.littleBlue,
      focusedBorderColor: AppColors.primaryBlue,
      prefixIcon: const Icon(
        Icons.schedule_rounded,
        color: AppColors.primaryBlue,
      ),
      onTap: () {
        controller.selectTime(context);
      },
    );
  }
}