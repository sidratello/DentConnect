import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/HomePage/controller/home_controller.dart';
import 'package:template/Dentist/HomePage/view/home_page.dart';

class ModeScreen extends StatelessWidget {
  const ModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appModeController = Get.find<HomeController>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.find<HomeController>().setPreviewMode(true);
                Get.to(() => const HomePage());
              },
              child: const Text("وضع الاطلاع"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.find<HomeController>().setPreviewMode(false);
                Get.to(() => const HomePage());
              },
              child: const Text("الوضع العادي"),
            ),
          ],
        ),
      ),
    );
  }
}
