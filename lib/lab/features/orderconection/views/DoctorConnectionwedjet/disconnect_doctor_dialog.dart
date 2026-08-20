import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/app_button.dart';

import '../../controller/connected_doctors_controller.dart';
import '../../model/connected_doctor_model.dart';

void showDisconnectDoctorDialog({
  required BuildContext context,
  required ConnectedDoctorModel doctor,
  required ConnectedDoctorsController controller,
}) {
  showDialog(
    context: context,
    builder: (_) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 58.w,
                height: 58.w,
                decoration: BoxDecoration(
                  color: AppColors.red.withOpacity(.10),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.link_off_rounded,
                  color: AppColors.red,
                  size: 30,
                ),
              ),

              SizedBox(height: 14.h),

              Text(
                'قطع الاتصال',
                style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
                  color: AppColors.darkBlue,
                  fontWeight: FontWeight.w800,
                ),
              ),

              SizedBox(height: 8.h),

              Text(
                'هل أنت متأكد من قطع الاتصال مع د. ${doctor.name}؟',
                textAlign: TextAlign.center,
                style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                  color: AppColors.normalText,
                ),
              ),

              SizedBox(height: 20.h),

              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      title: 'إلغاء',
                      type: AppButtonType.outlined,
                      borderColor: AppColors.normalText.withOpacity(.4),
                      textColor: AppColors.normalText,
                      onTap: Get.back,
                    ),
                  ),

                  SizedBox(width: 12.w),

                  Expanded(
                    child: Obx(
                      () => AppButton(
                        title: 'قطع الاتصال',
                        backgroundColor: AppColors.red,
                        isLoading: controller.isDisconnecting.value,
                         // أصغر من الافتراضي (48)

  textStyle: AppTextStyles.ibmRegular12DarkStyle.copyWith(
    color: AppColors.white,
    fontWeight: FontWeight.w700,
    fontSize: 15.sp, // تصغير حجم الخط
  ),
                        onTap: () async {
                          final success = await controller.disconnectDoctor(
                            doctor.id,
                          );

                          if (success) {
                            Get.back();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}