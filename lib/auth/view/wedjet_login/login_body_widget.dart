import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/auth/controller/login_controller.dart';
import 'package:template/auth/view/wedjet_signup/passwordvisibilityicon.dart';
import 'package:template/core/app_validators.dart';
import 'package:template/core/widgets/input_textfield.dart';

class LoginBodyWidget extends StatelessWidget {
  const LoginBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Column(
      children: [
        AuthInputField(
          hintText: 'الايميل',
          prefixIcon: const Icon(Icons.email),
          controller: controller.emailController,
            validator: (value) =>
                AppValidators.validateEmail(value),
        ),

        const SizedBox(height: 10),

        Obx(
          () => AuthInputField(
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

        const SizedBox(height: 5),
      ],
    );
  }
}