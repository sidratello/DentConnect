import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/HomePage/controller/home_controller.dart';
import 'package:template/core_dentist/utils/static.dart';

import '../../../../core_dentist/theme/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Static.getheight(context, 90),
      padding: EdgeInsets.symmetric(
        horizontal: Static.getwidth(context, 12),
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Color.fromRGBO(0, 0, 0, 0.08),
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildItem(
            context,
            image: 'assets/images/home_icon.png',
            title: 'الرئيسية',
            index: 0,
          ),
          _buildItem(
            context,
            image: 'assets/images/search_icon.png',
            title: 'البحث',
            index: 1,
          ),
          _buildCreateCaseButton(context),
          _buildItem(
            context,
            image: 'assets/images/Paper_Case.png',
            title: 'الحالات',
            index: 3,
          ),
          _buildProfileItem(context),
        ],
      ),
    );
  }

  Widget _buildItem(
    BuildContext context, {
    required String image,
    required String title,
    required int index,
  }) {
    final bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Static.getwidth(context, 10),
          vertical: Static.getheight(context, 6),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: isSelected
              ? Border.all(
                  color: AppColors.boxBlack,
                  width: 1.2,
                )
              : null,
          color: isSelected ? AppColors.boxBlack : AppColors.surfaceTintColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              image,
              width: Static.getwidth(context, 22),
              height: Static.getwidth(context, 22),
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: Static.getheight(context, 6),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w400,
                fontSize: Static.getwidth(context, 11.27),
                height: 16.91 / 11.27,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(BuildContext context) {
    final appModeController = Get.find<HomeController>();

    final bool isSelected = currentIndex == 4;

    return GestureDetector(
      onTap: () => onTap(4),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Static.getwidth(context, 10),
          vertical: Static.getheight(context, 6),
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromRGBO(210, 210, 210, 1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipOval(
              child: Image.asset(
                appModeController.isPreviewMode.value
                    ? 'assets/images/profile.png'
                    : 'assets/images/doctor_profile.png',
                width: Static.getwidth(context, 33),
                height: Static.getwidth(context, 33),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: Static.getheight(context, 6),
            ),
            Text(
              ' الشخصي',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w400,
                fontSize: Static.getwidth(context, 11.27),
                height: 16.91 / 11.27,
                color: const Color.fromRGBO(142, 142, 142, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreateCaseButton(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(2),
      child: Container(
        width: Static.getwidth(context, 45.08),
        height: Static.getwidth(context, 45.08),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 0, 202, 1),
          borderRadius: BorderRadius.circular(
            Static.getwidth(context, 7.17),
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/adding_icon.png',
            width: Static.getwidth(context, 24.42),
            height: Static.getwidth(context, 24.42),
          ),
        ),
      ),
    );
  }
}
