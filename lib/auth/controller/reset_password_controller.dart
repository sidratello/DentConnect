import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/auth/repository/reset_password_repo.dart';
import 'package:template/core/app_router.dart';

class ResetPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final code = ''.obs;
  final isLoading = false.obs;
  final isPasswordVisible = false.obs;
  final passwordController = TextEditingController();

  late final String email;

  final ResetPasswordRepo _repo = ResetPasswordRepo();

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments as String;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }



  Future<void> resetPassword() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    final response = await _repo.resetPassword(
      email: email,
      code: code.value,
      newPassword: passwordController.text.trim(),
    );

    isLoading.value = false;

    if (response.success) {
      Get.snackbar(
        'تم بنجاح',
        'تم تغيير كلمة المرور بنجاح',
        snackPosition: SnackPosition.BOTTOM,
      );

      Get.offAllNamed(AppRouter.loginpage);
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
    passwordController.dispose();
    super.onClose();
  }
}