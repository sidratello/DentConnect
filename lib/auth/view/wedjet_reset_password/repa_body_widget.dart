import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import 'package:template/auth/controller/reset_password_controller.dart';
import 'package:template/auth/view/wedjet_signup/passwordvisibilityicon.dart';



import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/app_validators.dart';
import 'package:template/core/widgets/input_textfield.dart';

class ResetPasswordBodyWidget extends StatelessWidget {
  const ResetPasswordBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
final controller = Get.find<ResetPasswordController>();
    return Column(
      children: [
        const SizedBox(height: 160),

               Text(
  'أدخل رمز التحقق المرسل إلى بريدك الإلكتروني\nثم قم بإنشاء كلمة مرور جديدة',
  textAlign: TextAlign.center,
  style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
    color: AppColors.primaryBlue,
    height: 1.8,
    fontSize: 16
  ),
),

        const SizedBox(height: 20),

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
     const SizedBox(height: 20),
         Obx(
           () => 
          AuthInputField(
             controller: controller.passwordController,
            hintText: 'كلمة السر',
             obscureText: !controller.isPasswordVisible.value,
              validator: AppValidators.validatePassword,
            suffixIcon: PasswordVisibilityIcon(
              visible: controller.isPasswordVisible.value,
              onPressed: controller.togglePasswordVisibility,
              
            ),
          ),
        ),



        const SizedBox(height: 20),
      ],
    );
  }
}