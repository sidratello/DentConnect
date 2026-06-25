import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/homepage/controller/homecontroller.dart';

import 'package:get/get.dart';




class LabHomeHeader extends StatelessWidget {
  const LabHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LabHomeController>();

    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 22.h, 24.w, 0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 35.r,
              backgroundImage: const AssetImage(
                'assets/images/imagedentist.png',
              ),
            ),
          ),

          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.labName.value,
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
          ),

          const Spacer(),

          Icon(
            Icons.notifications_none,
            color: Colors.white,
            size: 30.sp,
          ),
        ],
      ),
    );
  }
}