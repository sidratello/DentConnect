

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/auth/controller/signup_controller.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/app_header.dart';

/// ================= HEADER WIDGET =================


class SignupHeaderWidget extends StatelessWidget {
  const SignupHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();

    return Column(
      children: [
        const SizedBox(height: 34),

        AuthHeader(
          title: 'اطباء',
          onBack: controller.goBack,
        ),

        Image.asset(
          'assets/images/Doctor doing teeth treatment to patient.png',
          width: 250,
          height: 250,
        ),

        const SizedBox(height: 10),

        Text(
          ' ! مرحباً بك   ',
          style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
            color: AppColors.primaryBlue,
          ),
        ),

        Text(
          'ادخل معلومات حسابك',
          style: AppTextStyles.ibmRegular12DarkStyle,
        ),

        const SizedBox(height: 10),
      ],
    );
  }
}