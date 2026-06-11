import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/app_button.dart';
import 'package:template/lab/features/profile/controller/profilecontroller.dart';
import 'package:template/lab/features/profile/controller/editprofilecontroller.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/custom_gallery_grid.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/section_card.dart';

class GalleryEditSection extends StatelessWidget {
  final EditLabProfileController controller;

  const GalleryEditSection({
    super.key,
    required this.controller,
  });

  String imageUrl(String path) {
    const baseUrl = 'http://192.168.1.10:44352/';

    if (path.startsWith('/')) {
      return '$baseUrl${path.substring(1)}';
    }

    return '$baseUrl$path';
  }

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<LabProfileController>();

    return Obx(() {
      final profile = profileController.profile.value;
      final gallery = profile?.gallery ?? [];

      return ProfileSectionCard(
        title: null,
        padding: EdgeInsets.all(16.w),
        children: [
          Row(
            children: [
    

              Text(
                'معرض الأعمال',
                style: AppTextStyles.ibmBold22NeutralStyle,
              ),
                 const Spacer(),
                        AppButton(
                title: 'إضافة ',
                width: 135.w,
                height: 48.h,
                borderRadius: 10.r,
                type: AppButtonType.filled,
                backgroundColor: AppColors.primaryBlue,
                textStyle: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                onTap: controller.addGalleryImage,
              ),

           
            ],
          ),

          SizedBox(height: 18.h),

          Container(
            width: double.infinity,
            height: 300.h,
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: gallery.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        size: 70.sp,
                        color: AppColors.grey400,
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'لا توجد صور حالياً',
                        style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'المعرض فارغ',
                        style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
                          color: AppColors.grey600,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                : GalleryGrid(
  scrollable: true,
  itemCount: gallery.length,
  imageUrl: (index) => imageUrl(gallery[index].path),
  onDelete: (index) {
    controller.deleteGalleryImage(
      gallery[index].id,
    );
  },
)
          ),
        ],
      );
    });
  }
}