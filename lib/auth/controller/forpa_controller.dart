import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/auth/repository/forpa_repo.dart';
import 'package:template/core/app_router.dart';

class ForgetPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  final ForgetPasswordRepo _repo = ForgetPasswordRepo();

  final isLoading = false.obs;

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
        arguments: emailController.text.trim(),
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