import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

import '../../controller/create_blog_controller.dart';

class SensitiveInfoCard extends StatelessWidget {
  const SensitiveInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<CreateBlogController>();

    return Obx(
      () => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color:
              AppColors.primaryBlue.withOpacity(.055),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color:
                AppColors.primaryBlue.withOpacity(.10),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.shield_outlined,
              color: AppColors.primaryBlue,
              size: 32,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'معلومات حساسة',
                        style: AppTextStyles
                            .ibmRegular14NeutralStyle
                            .copyWith(
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color:    const Color.fromARGB(255, 236, 228, 250),
                          borderRadius:
                              BorderRadius.circular(20),
                        ),
                        child: Text(
                          'اختياري',
                          style: AppTextStyles
                              .ibmRegular12DarkStyle
                              .copyWith(
                            color:
                               Colors.deepPurple[300],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  InkWell(
                    onTap: () {
                      controller.toggleSensitive(
                        !controller
                            .isSensitiveRedacted.value,
                      );
                    },
                    borderRadius:
                        BorderRadius.circular(8),
                    child: Row(
                      children: [
                        Checkbox(
                          value: controller
                              .isSensitiveRedacted.value,
                          onChanged:
                              controller.toggleSensitive,
                          activeColor:
                              AppColors.primaryBlue,
                          visualDensity:
                              VisualDensity.compact,
                        ),
                        Expanded(
                          child: Text(
                            'يحتوي هذا المنشور على معلومات حساسة',
                            style: AppTextStyles
                                .ibmRegular14NeutralStyle
                                .copyWith(
                              color:
                                  AppColors.darkBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'سيتم إبار الادمن بوجود  البيانات الحساسة قبل نشر المنشور لحماية الخصوصية.',
                    style: AppTextStyles
                        .ibmRegular12DarkStyle
                        .copyWith(
                      color: AppColors.normalText,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}