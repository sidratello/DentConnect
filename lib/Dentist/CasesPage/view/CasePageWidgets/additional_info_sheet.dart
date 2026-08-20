import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core_dentist/theme/app_colors.dart';

void showAdditionalInfoSheet() {
  final notesController = TextEditingController();

  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'معلومات إضافية مطلوبة',
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(
                16,
              ),
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(
                  14,
                ),
              ),
              child: const Text(
                'يرجى رفع صورة إضافية وإضافة أي ملاحظات يحتاجها المخبر.',
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            OutlinedButton.icon(
              onPressed: () {
                /// image picker
              },
              icon: const Icon(
                Icons.image_outlined,
              ),
              label: const Text(
                'رفع صور',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: notesController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'أضف ملاحظاتك...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    14,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'إرسال',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'إلغاء الطلب',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
