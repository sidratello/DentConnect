import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/auth/controller/forpa_controller.dart';

import 'package:template/core/app_validators.dart';
import 'package:template/core/widgets/auth_card.dart';
import 'package:template/core/widgets/input_textfield.dart';

class fpBodyWidget extends StatelessWidget {
  const fpBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ForgetPasswordController>();

   return AuthCard(
  icon: Icons.lock_reset_rounded,
  title: 'استعادة كلمة المرور',
  subtitle:
      'أدخل بريدك الإلكتروني وسنرسل لك رمز تحقق لإعادة تعيين كلمة المرور.',
  children: [
    AuthInputField(
      hintText: 'البريد الإلكتروني',
      prefixIcon: const Icon(Icons.email_outlined),
      controller: controller.emailController,
      validator: (value) => AppValidators.validateEmail(value),
    ),
      const SizedBox(height: 24),
  ],
  
);


  }
}