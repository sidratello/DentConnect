

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:template/auth/repository/login_repo.dart';
import 'package:template/core/app_router.dart';
import 'package:template/core/storage_services.dart';
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
 if (!response.success || response.data == null) {
      Get.snackbar(
        'خطأ',
        response.message,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final user = response.data!;

    /// ================= FULL ACCESS =================
    if (user.status == 'Active' &&
        user.accessMode == 'Full' &&
        user.accessToken != null) {
      await _saveFullUser(user);

      Get.snackbar(
        'تم بنجاح',
        'تم تسجيل الدخول بنجاح',
        snackPosition: SnackPosition.BOTTOM,
      );

      _goToHomeByRole(user.role);

      return;
    }

    /// ================= PENDING VERIFICATION =================
    if (user.status == 'PendingVerification') {
      Get.defaultDialog(
        title: 'البريد غير مؤكد',
        middleText:
            'يمكنك تأكيد البريد الإلكتروني الآن أو المتابعة بوضع الاطلاع فقط.',

        textConfirm: 'تأكيد البريد',
        textCancel: 'وضع الاطلاع',

        confirmTextColor: Colors.white,

        onConfirm: () {
          Get.back();

          Get.toNamed(
            AppRouter.OTPpage,
            arguments: emailController.text.trim(),
          );
        },

        onCancel: () async {
          await _saveReadOnlyUser(user);

          Get.snackbar(
            'وضع الاطلاع',
            'تم الدخول بوضع الاطلاع فقط.',
            snackPosition: SnackPosition.BOTTOM,
          );

          _goToHomeByRole(user.role);
        },
      );

      return;
    }

    /// ================= READ ONLY =================
    if (user.accessMode == 'ReadOnly') {
      await _saveReadOnlyUser(user);

      Get.snackbar(
        'وضع الاطلاع',
        _getReadOnlyMessage(user.status),
        snackPosition: SnackPosition.BOTTOM,
      );

      _goToHomeByRole(user.role);

      return;
    }

    /// ================= FALLBACK =================
    Get.snackbar(
      'خطأ',
      user.message ?? 'لا يمكنك تسجيل الدخول حالياً.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  /// ================= SAVE FULL USER =================
  Future<void> _saveFullUser(dynamic user) async {
    await StorageService.to.saveToken(user.accessToken!);

    if (user.refreshToken != null) {
      await StorageService.to.write(
        'refreshToken',
        user.refreshToken,
      );
    }

    await StorageService.to.write('userId', user.userId);

    await StorageService.to.write('labId', user.labId);

    await StorageService.to.write('role', user.role);

    await StorageService.to.write('status', user.status);

    await StorageService.to.write(
      'accessMode',
      user.accessMode,
    );
  }

  /// ================= SAVE READ ONLY =================
  Future<void> _saveReadOnlyUser(dynamic user) async {
    await StorageService.to.write('userId', user.userId);

    await StorageService.to.write('labId', user.labId);

    await StorageService.to.write('role', user.role);

    await StorageService.to.write('status', user.status);

    await StorageService.to.write(
      'accessMode',
      'ReadOnly',
    );

    /// remove tokens
    await StorageService.to.remove('token');

    await StorageService.to.remove('refreshToken');
  }

  /// ================= READ ONLY MESSAGE =================
  String _getReadOnlyMessage(String status) {
    if (status == 'PendingAdminApproval') {
      return 'حسابك بانتظار موافقة الإدارة، تم الدخول بوضع الاطلاع فقط.';
    }

    if (status == 'Suspended') {
      return 'تم إيقاف حسابك، يمكنك التصفح بوضع الاطلاع فقط.';
    }

    return 'تم الدخول بوضع الاطلاع فقط.';
  }

  /// ================= NAVIGATION =================
  void _goToHomeByRole(String role) {
    if (role == 'Lab') {
      // Get.offAllNamed(AppRouter.labHomePage);
    } else if (role == 'Dentist') {
      // Get.offAllNamed(AppRouter.dentistHomePage);
    } else {
      // Get.offAllNamed(AppRouter.homePage);
    }
  }

  void goBack() {
    Get.back();
  }

  @override
  void onClose() {
    super.onClose();
  }
}