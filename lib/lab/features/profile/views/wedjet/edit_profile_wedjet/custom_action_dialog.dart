import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomActionDialog {
  static void show({
    required BuildContext context,
    required String title,
    required Widget content,

    /// الزر الذي تريد عرضه (AppButton أو أي Widget آخر)
    required Widget confirmButton,

    String cancelText = 'إلغاء',
  }) {
    Get.dialog(
      Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: Text(title),

          content: content,

          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text(cancelText),
            ),

            confirmButton,
          ],
        ),
      ),
    );
  }
}