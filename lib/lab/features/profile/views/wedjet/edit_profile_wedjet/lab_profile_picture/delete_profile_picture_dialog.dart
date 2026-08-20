import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/custom_action_dialog.dart';
import 'package:template/lab/features/profile/controller/editprofilecontroller.dart';

void showDeleteProfilePictureDialog(
  EditLabProfileController controller,
) {
  CustomActionDialog.show(
    title: 'حذف صورة المختبر',
    content: SizedBox(
      width: Get.width * 0.78,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'هل أنت متأكد من حذف صورة المختبر؟',
            textAlign: TextAlign.center,
            style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
              color: AppColors.grey600,
              height: 1.6,
            ),
          ),
          SizedBox(height: 22.h),
          Container(
            width: 72.w,
            height: 72.w,
            decoration: BoxDecoration(
              color: AppColors.lightRed.withOpacity(.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.delete_forever_rounded,
              color: AppColors.lightRed,
              size: 40.sp,
            ),
          ),
        ],
      ),
    ),
    confirmButton: TextButton(
      onPressed: () {
        Get.back();
        controller.deleteProfilePicture();
      },
      child: Text(
        'حذف',
        style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
          color: AppColors.lightRed,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}