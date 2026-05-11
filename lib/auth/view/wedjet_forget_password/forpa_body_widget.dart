import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:template/auth/controller/forpa_controller.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/app_validators.dart';
import 'package:template/core/widgets/input_textfield.dart';

class fpBodyWidget extends StatelessWidget {
  const fpBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
final controller = Get.find<ForgetPasswordController>();

    return Column(
      children: [
        const SizedBox(height: 160),

        Text(
 ':أدخل بريدك الإلكتروني لاستعادة كلمة المرور',
          style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
            color: AppColors.primaryBlue,
          ),
        ),

        const SizedBox(height: 20),

  

          AuthInputField(
          hintText: 'الايميل',
          prefixIcon: const Icon(Icons.email),
         controller: controller.emailController,
            validator: (value) =>
                AppValidators.validateEmail(value),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}