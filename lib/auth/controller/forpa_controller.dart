import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/auth/repository/forpa_repo.dart';
import 'package:template/core/app_router.dart';

class ForgetPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late final String role;
  final emailController = TextEditingController();

  final ForgetPasswordRepo _repo = ForgetPasswordRepo();

  final isLoading = false.obs;
@override
void onInit() {
  super.onInit();
  role = Get.arguments ?? 'Dentist';
}
  Future<void> forgotPassword() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    final response = await _repo.forgotPassword(
      email: emailController.text.trim(),
    );

    isLoading.value = false;

    if (response.success) {
      Get.snackbar(
        'تم الإرسال',
        'تم إرسال رمز التحقق إلى بريدك الإلكتروني.',
        snackPosition: SnackPosition.BOTTOM,
      );

   Get.toNamed(
  AppRouter.resetpasswordpage,
  arguments: {
    'email': emailController.text.trim(),
    'role': role,
  },
);
    } else {
      Get.snackbar(
        'خطأ',
        response.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void goBack() {
    Get.back();
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}