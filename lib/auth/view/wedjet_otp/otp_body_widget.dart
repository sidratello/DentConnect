import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:template/auth/controller/otp_controller.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/auth_card.dart';

class OtpBodyWidget extends StatelessWidget {
  const OtpBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OtpController>();

    return  AuthCard(
  topSpacing: 85,
  icon: Icons.mark_email_read_rounded,
  title: 'أدخل رمز التحقق',
  subtitle:
      'تم إرسال رمز مكون من 6 أرقام إلى بريدك الإلكتروني.\nأدخله لإكمال عملية التحقق.',
  iconBoxSize: 48,
  iconSize: 36,
  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 28),
  children: [
    OtpTextField(
      numberOfFields: 6,
      borderColor: const Color(0xFFE2E8F0),
      focusedBorderColor: AppColors.primaryBlue,
      fieldWidth: 45,
      fieldHeight: 55,
      borderRadius: BorderRadius.circular(14),
      showFieldAsBox: true,
      filled: true,
      fillColor: const Color(0xFFF8FAFC),
      keyboardType: TextInputType.number,
      textStyle: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
        color: AppColors.neutral1000,
        fontWeight: FontWeight.w700,
      ),
      onCodeChanged: (value) {
        controller.code.value = value;
      },
      onSubmit: (value) {
        controller.code.value = value;
      },
    ),
  ],
);}}