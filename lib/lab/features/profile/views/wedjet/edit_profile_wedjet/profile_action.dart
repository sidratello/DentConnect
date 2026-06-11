import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:template/core/widgets/app_button.dart';
import 'package:template/lab/features/profile/controller/editprofilecontroller.dart';

class LabProfileBottom extends StatelessWidget {
  const LabProfileBottom({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EditLabProfileController>();

    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 25.h),
      child: Obx(() {
        return AppButton(
          title: controller.isLoading.value
              ? 'جاري الحفظ...'
              : 'حفظ التغييرات',
          type: AppButtonType.gradient,
          height: 58.h,
          borderRadius: 18.r,
          isLoading: controller.isLoading.value,
          onTap: controller.updateProfile,
        );
      }),
    );
  }
}