

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:template/auth/repository/login_repo.dart';
class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final isPasswordVisible = false.obs;
  final LoginRepo _repo = LoginRepo();
  final isLoading = false.obs;



  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }






   Future<void> loginDentist() async {


    isLoading.value = true;

    final response = await _repo.loginDentist(

      email: emailController.text.trim(),
      password: passwordController.text.trim(),

    );

    isLoading.value = false;

    if (response.success) {
      Get.snackbar(
        
        'تم بنجاح',
        'تم تسجيل الدخول بنجاح، لكن حسابك بانتظار موافقة الإدارة',
        snackPosition: SnackPosition.BOTTOM,
        
      );

      print(response.data);
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

    // emailController.dispose();
    // passwordController.dispose();


  super.onClose();
  }
}

