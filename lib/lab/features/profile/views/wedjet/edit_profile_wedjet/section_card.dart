/// profile_section_card.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
class ProfileSectionCard extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsetsGeometry? padding;

  const ProfileSectionCard({
    super.key,
    this.title,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.10),
            blurRadius: 10.r,
            offset: Offset(4.w, 4.h),
          ),
        ],
        border: Border.all(
          width: 3.w,
          color: Colors.grey.shade300,
        ),
      ),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          if (title != null) ...[
            Text(
              title!,
              textAlign: TextAlign.right,
              style: AppTextStyles.ibmBold22NeutralStyle,
            ),
            SizedBox(height: 14.h),
          ],

          ...children,
        ],
      ),
    );
  }
}