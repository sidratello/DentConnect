import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/splash/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());

    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: Image.asset('assets/images/Logo.jpg'),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      controller.errorMessage.value,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: controller.loadProfile,
                      child: const Text('إعادة المحاولة'),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
