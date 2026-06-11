import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomActionDialog {
  static void show({
    required BuildContext context,
    required String title,
    required Widget content,
    required String confirmText,
    required VoidCallback onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(title),

          content: content,

          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('إلغاء'),
            ),

            TextButton(
              onPressed: onConfirm,
              child: Text(confirmText),
            ),
          ],
        );
      },
    );
  }
}