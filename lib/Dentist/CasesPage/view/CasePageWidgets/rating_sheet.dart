import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';

void showRatingSheet() {
  final noteController = TextEditingController();

  double rating = 0;

  Get.bottomSheet(
    StatefulBuilder(
      builder: (context, setState) {
        return Container(
          padding: const EdgeInsets.all(
            24,
          ),
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(
                28,
              ),
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'قيّم تجربتك',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => IconButton(
                      onPressed: () {
                        setState(
                          () {
                            rating = index + 1;
                          },
                        );
                      },
                      icon: Icon(
                        Icons.star,
                        color: index < rating
                            ? AppColors.yellowRate
                            : AppColors.greyColor,
                      ),
                    ),
                  ),
                ),
                TextField(
                  controller: noteController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'اكتب ملاحظتك...',
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
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'إرسال التقييم',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
