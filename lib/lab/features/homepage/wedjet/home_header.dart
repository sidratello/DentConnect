import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class LabHomeHeader extends StatelessWidget {
  const LabHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
final labName = box.read('labName') ?? '';
final displayName =labName.isEmpty ? 'المخبر' : ' $labName';
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 22.h, 24.w, 0),
      child: Row(
  children: [

    /// LEFT NOTIFICATION
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 35.r,
        backgroundImage: const AssetImage(
          'assets/images/imagedentist.png',
         
        ),
      ),
    ),

    /// TEXT
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
         (displayName),
          style: AppTextStyles.ibmBold22NeutralStyle.copyWith(
  color: AppColors.white,
  fontSize: 19.sp,
),
        ),
        Text(
          'مرحبا بك',
         style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
  color: Colors.white70,
),
        ),
      ],
    ),

      const Spacer(),
    Icon(
      Icons.notifications_none,
      color: Colors.white,
      size: 30.sp,
    ),

   
  ],
)
    );
  }
}