import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/app_button.dart';
import 'package:template/lab/features/profile/controller/editprofilecontroller.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/section_card.dart';

import 'delete_profile_picture_dialog.dart';
import 'profile_picture_preview.dart';

class LabProfilePictureSection extends StatelessWidget {
  final EditLabProfileController controller;

  const LabProfilePictureSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileSectionCard(
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'صورة المخبر',
                style: AppTextStyles.ibmBold22NeutralStyle.copyWith(
                  color: AppColors.darkBlue,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                'يمكنك إضافة صورة تمثل مخبرك.',
                style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                  color: AppColors.grey600,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                '(اختياري)',
                style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 18.h),

              Center(
                child: Obx(
                  () => ProfilePicturePreview(
                    localImage:
                        controller.selectedProfilePicture.value,
                    imageUrl:
                        controller.profilePictureUrl.value,
                    isLoading:
                        controller.isProfilePictureLoading.value,
                    onTap:
                        controller.pickAndUploadProfilePicture,
                  ),
                ),
              ),

              SizedBox(height: 30.h),

              Obx(() {
                final hasImage = controller.hasProfilePicture;
                final loading =
                    controller.isProfilePictureLoading.value;

                return Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        title: hasImage
                            ? 'تغيير الصورة'
                            : 'إضافة الصورة',
                        onTap: loading
                            ? null
                            : controller
                                .pickAndUploadProfilePicture,
                        type: AppButtonType.outlined,
                        height: 50.h,
                        borderRadius: 14.r,
                        borderColor: AppColors.primaryBlue,
                        textColor: AppColors.primaryBlue,
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                        ),
                        textStyle: AppTextStyles
                            .ibmRegular14NeutralStyle
                            .copyWith(
                          color: AppColors.primaryBlue,
                          fontWeight: FontWeight.w600,
                          fontSize: 13.sp,
                        ),
                        icon: Icon(
                          Icons.image_outlined,
                          color: AppColors.primaryBlue,
                          size: 20.sp,
                        ),
                      ),
                    ),

                    SizedBox(width: 12.w),

                    Expanded(
                      child: AppButton(
                        title: 'حذف الصورة',
                        onTap: hasImage && !loading
                            ? () =>
                                showDeleteProfilePictureDialog(
                                  controller,
                                )
                            : null,
                        enabled: hasImage && !loading,
                        type: AppButtonType.outlined,
                        height: 50.h,
                        borderRadius: 14.r,
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                        ),
                        borderColor: hasImage
                            ? AppColors.lightRed
                            : AppColors.grey400,
                        textColor: hasImage
                            ? AppColors.lightRed
                            : AppColors.grey400,
                        textStyle: AppTextStyles
                            .ibmRegular14NeutralStyle
                            .copyWith(
                          color: hasImage
                              ? AppColors.lightRed
                              : AppColors.grey400,
                          fontWeight: FontWeight.w600,
                          fontSize: 13.sp,
                        ),
                        icon: Icon(
                          Icons.delete_outline_rounded,
                          color: hasImage
                              ? AppColors.lightRed
                              : AppColors.grey400,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}