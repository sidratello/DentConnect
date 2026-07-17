import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/HomePage/controller/home_controller.dart';
import 'package:template/core/utils/static.dart';

import '../../../../core/theme/app_colors.dart';

class LabsSectionHeader extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const LabsSectionHeader({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final appModeController = Get.find<HomeController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'المخابر',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w700,
              fontSize: Static.getwidth(context, 24),
              color: AppColors.black,
            ),
          ),
          Opacity(
            opacity: appModeController.isPreviewMode.value ? 0.5 : 1,
            child: IgnorePointer(
              ignoring: appModeController.isPreviewMode.value,
              child: Container(
                width: Static.getwidth(context, 240),
                decoration: BoxDecoration(
                  color: appModeController.isPreviewMode.value
                      ? Theme.of(context).shadowColor
                      : AppColors.boxGrey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildTab(
                          context,
                          title: 'الكل',
                          index: 0,
                        ),
                      ),
                      Expanded(
                        child: _buildTab(
                          context,
                          title: ' المتصلة',
                          index: 2,
                        ),
                      ),
                      Container(
                        width: 1,
                        height: Static.getheight(context, 24),
                        color: AppColors.greyColor,
                      ),
                      Expanded(
                        child: _buildTab(
                          context,
                          title: 'غير المتصلة',
                          index: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(
    BuildContext context, {
    required String title,
    required int index,
  }) {
    final appModeController = Get.find<HomeController>();

    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: Static.getheight(context, 12),
        ),
        decoration: BoxDecoration(
          color: appModeController.isPreviewMode.value
              ? index == 0
                  ? AppColors.greyColor
                  : AppColors.surfaceTintColor
              : isSelected
                  ? AppColors.primary
                  : AppColors.surfaceTintColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w500,
                fontSize: Static.getwidth(context, 14),
                color: appModeController.isPreviewMode.value
                    ? index == 0
                        ? AppColors.white
                        : AppColors.greyColor
                    : isSelected
                        ? AppColors.white
                        : AppColors.greyColor),
          ),
        ),
      ),
    );
  }
}
