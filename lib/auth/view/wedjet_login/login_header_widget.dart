import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/auth/controller/login_controller.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/app_header.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Column(
      children: [
        const SizedBox(height: 34),

        AuthHeader(
         title: controller.isLab ? 'مخابر' : 'أطباء',
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