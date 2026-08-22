import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_router.dart';
import 'package:template/core/storage_services.dart';
import 'package:template/auth/repository/logout_repository.dart';
import 'package:template/auth/notification_service.dart';

class LogoutController extends GetxController {
  final LogoutRepository repository;

  LogoutController({
    required this.repository,
  });

  final isLoggingOut = false.obs;

  Future<void> logout() async {
    if (isLoggingOut.value) {
      return;
    }

    try {
      isLoggingOut.value = true;

      final refreshToken = StorageService.to.read<String>(
        'refreshToken',
      );

      if (refreshToken != null && refreshToken.trim().isNotEmpty) {
        final response = await repository.logout(
          refreshToken: refreshToken,
        );

        if (!response.success) {
          Get.snackbar(
            'تنبيه',
            response.message,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }

      await _clearUserSession();

      Get.offAllNamed(
        AppRouter.choseuserpage,
      );
    } catch (_) {
      // حتى لو فشل طلب logout من السيرفر
      // نحذف الجلسة محلياً.
      await _clearUserSession();

      Get.offAllNamed(
        AppRouter.choseuserpage,
      );
    } finally {
      isLoggingOut.value = false;
    }
  }

  Future<void> _clearUserSession() async {
    await NotificationService().stopConnection();

    await StorageService.to.clearAll();
  }

  void confirmLogout() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        title: const Text(
          'تسجيل الخروج',
          textAlign: TextAlign.right,
        ),
        content: const Text(
          'هل أنت متأكد أنك تريد تسجيل الخروج من حسابك؟',
          textAlign: TextAlign.right,
        ),
        actions: [
          TextButton(
            onPressed: Get.back,
            child: const Text(
              'إلغاء',
            ),
          ),
          Obx(
            () => TextButton(
              onPressed: isLoggingOut.value
                  ? null
                  : () {
                      Get.back();
                      logout();
                    },
              child: isLoggingOut.value
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                  : const Text(
                      'تسجيل الخروج',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
            ),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
