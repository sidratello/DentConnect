import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/theme/app_colors.dart';

import '../../../../core/utils/static.dart';
import '../../controller/community_controller.dart';

class CommunityTabs extends StatelessWidget {
  const CommunityTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CommunityController>();

    return Obx(
      () => Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.border,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: _TabItem(
                title: 'كل المنشورات',
                isSelected: controller.selectedTab.value == 0,
                onTap: () {
                  controller.changeTab(0);
                },
              ),
            ),
            Expanded(
              child: _TabItem(
                title: 'منشوراتي',
                isSelected: controller.selectedTab.value == 1,
                onTap: () {
                  controller.changeTab(1);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.surfaceTintColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w600,
              fontSize: Static.getwidth(context, 14),
              color: isSelected ? AppColors.white : AppColors.greyLight,
            ),
          ),
        ),
      ),
    );
  }
}
