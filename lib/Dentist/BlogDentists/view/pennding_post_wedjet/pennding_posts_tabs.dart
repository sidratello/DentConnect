import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/BlogDentists/controller/BlogPostsController.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class MyBlogDoctorPostsTabs extends GetView<MyBlogDoctorPostsController> {
  const MyBlogDoctorPostsTabs({
    super.key,
  });

  static const List<String> titles = [
    'المنشورات العامة',
    'بانتظار الموافقة',
    'المرفوضة',
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: List.generate(
          titles.length,
          (index) {
            final selected = controller.selectedTabIndex.value == index;

            return Expanded(
              child: InkWell(
                onTap: () => controller.selectTab(index),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 4,
                      ),
                      child: Text(
                        titles[index],
                        textAlign: TextAlign.center,
                        style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                          color: selected
                              ? AppColors.primaryBlue
                              : AppColors.normalText,
                          fontWeight:
                              selected ? FontWeight.w700 : FontWeight.w500,
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 200,
                      ),
                      height: 3,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: selected
                            ? AppColors.primaryBlue
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
