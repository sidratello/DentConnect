import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_validators.dart';
import 'package:template/core/widgets/input_textfield.dart';
import 'package:template/lab/features/lab_ad/controller/create_lab_ad_controller.dart';


class AdExpirationDateField
    extends GetView<CreateLabAdController> {
  const AdExpirationDateField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AuthInputField(
      title:
          'تاريخ انتهاء الإعلان *',
      hintText:
          'اختر تاريخ انتهاء الإعلان',
      controller:
          controller
              .expirationDateController,
      readOnly: true,
      keyboardType:
          TextInputType.none,
      validator: AppValidators
          .validateAdvertisementDate,
      onTap: () {
        controller
            .selectExpirationDate(
          context,
        );
      },
      fillColor: AppColors.white,
      borderColor:
          AppColors.littleBlue
              .withOpacity(.9),
      focusedBorderColor:
          AppColors.primaryBlue,
      prefixIcon: const Icon(
        Icons.calendar_month_outlined,
        color: AppColors.primaryBlue,
      ),
      suffixIcon: const Icon(
        Icons
            .keyboard_arrow_down_rounded,
        color: AppColors.normalText,
      ),
    );
  }
}