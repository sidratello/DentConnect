import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
class HomeActionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
final int? count;
  const HomeActionCard({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.black54,
              blurRadius: 18.r,
              offset: Offset(0, 8.h),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Stack(
  clipBehavior: Clip.none,
  children: [
    Container(
      width: 48.w,
      height: 48.w,
      decoration: BoxDecoration(
        color: AppColors.lightCyan,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Icon(
        icon,
        color: AppColors.darkBlue,
        size: 30.sp,
      ),
    ),

    if (count != null && count! > 0)
      Positioned(
        top: -8.h,
        right: -8.w,
        child: Container(
          width: 22.w,
          height: 22.w,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: AppColors.red,
            shape: BoxShape.circle,
          ),
          child: Text(
            count.toString(),
            style: AppTextStyles.ibmRegular12DarkStyle.copyWith(
              color: AppColors.white,
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
  ],
),
            SizedBox(height: 14.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.ibmBold22NeutralStyle.copyWith(
  color: AppColors.darkBlue,
  fontSize: 15.sp,
)
            ),
          ],
        ),
      ),
    );
  }
}