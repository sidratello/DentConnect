import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:template/auth/controller/otp_controller.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class OtpBodyWidget extends StatelessWidget {
  const OtpBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OtpController>();

    return Column(
      children: [
        const SizedBox(height: 150),

        Text(
          'أدخل رمز التحقق',
          style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
            color: AppColors.primaryBlue,
          ),
        ),

        const SizedBox(height: 6),

        Text(
          'تم إرسال رمز مكون من 6 أرقام إلى بريدك',
          style: AppTextStyles.ibmRegular12DarkStyle,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 30),

        OtpTextField(
          numberOfFields: 6,
          borderColor: const Color(0xFFE0E0E0),
          focusedBorderColor: AppColors.primaryBlue,
          fieldWidth: 46,
          borderRadius: BorderRadius.circular(12),
          showFieldAsBox: true,
          filled: true,
          fillColor: Colors.white,
          keyboardType: TextInputType.number,
          onCodeChanged: (value) {
            controller.code.value = value;
          },
          onSubmit: (value) {
            controller.code.value = value;
          },
        ),

        const SizedBox(height: 30),
      ],
    );
  }
}