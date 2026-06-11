import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
class ExperienceChip extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Color? backgroundColor;
  final VoidCallback? onDelete;

  const ExperienceChip({
    super.key,
    required this.title,
    this.icon,
    this.backgroundColor,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: backgroundColor ?? AppColors.lightCyan,

      side: BorderSide(
        color: AppColors.primaryBlue.withOpacity(.2),
      ),

      label: Text(
        title,
        style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
          color: AppColors.primaryBlue,
          fontWeight: FontWeight.w600,
        ),
      ),

 

      deleteIcon: onDelete != null
          ? Icon(
              Icons.close,
              size: 18.sp,
              color: AppColors.primaryBlue,
            )
          : null,

      onDeleted: onDelete,
    );
  }
}