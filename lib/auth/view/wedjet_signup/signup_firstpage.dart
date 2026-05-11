import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/auth/controller/signup_controller.dart';
import 'package:template/core/app_validators.dart';
import 'package:template/core/widgets/input_textfield.dart';
import 'package:template/auth/view/wedjet_signup/passwordvisibilityicon.dart';
class SignupFirstPage extends StatelessWidget {
  const SignupFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();

    return SingleChildScrollView(
      child: Column(
        children: [
           AuthInputField(
            hintText: 'الاسم',
            prefixIcon: Icon(Icons.person),
            controller: controller.nameController,
                  validator: (value) =>
                AppValidators.validateRequired(value, 'الاسم'),
          ),

           SizedBox(height: 10),

           AuthInputField(
            hintText: 'الايميل',
            prefixIcon: Icon(Icons.email),
            controller: controller.emailController,
            validator: (value) =>
                AppValidators.validateEmail(value),
          ),

          const SizedBox(height: 10),

          Obx(
            () => AuthInputField(
              controller: controller.passwordController,
              hintText: 'كلمة السر',
          validator: AppValidators.validatePassword,
              obscureText: !controller.isPasswordVisible.value,
              suffixIcon: PasswordVisibilityIcon(
                visible: controller.isPasswordVisible.value,
                onPressed: controller.togglePasswordVisibility,

              ),
            ),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}