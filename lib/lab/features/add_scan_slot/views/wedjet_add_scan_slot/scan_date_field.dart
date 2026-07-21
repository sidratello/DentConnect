import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/input_textfield.dart';
import 'package:template/lab/features/add_scan_slot/controller/scan_slot_form_controller.dart';

class ScanDateField extends StatelessWidget {
     final ScanSlotFormController controller;
  const ScanDateField({super.key, required this.controller,});

  @override
  Widget build(BuildContext context) {


    return AuthInputField(
      title: 'التاريخ',
      hintText: 'اختر التاريخ',
      controller: controller.dateController,
      readOnly: true,
      fillColor: AppColors.white,
      borderColor: AppColors.littleBlue,
      prefixIcon: const Icon(
        Icons.calendar_month_outlined,
        color: AppColors.primaryBlue,
      ),
      onTap: () {
        controller.selectDate(context);
      },
    );
  }
}