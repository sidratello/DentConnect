import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackbar {
  static void success({
    required String title,
    required String message,
  }) {
    Get.snackbar(
      '',
      '',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      margin: const EdgeInsets.all(12),
      borderRadius: 12,

      titleText: Text(
        title,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 16,
        ),
      ),

      messageText: Text(
        message,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }


}