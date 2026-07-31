import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_helper.dart';
import 'package:template/core/widgets/AppLoadingIndicator.dart';

import 'empty_profile_picture.dart';

class ProfilePicturePreview extends StatelessWidget {
  final File? localImage;
  final String imageUrl;
  final bool isLoading;
  final VoidCallback onTap;

  const ProfilePicturePreview({
    super.key,
    required this.localImage,
    required this.imageUrl,
    required this.isLoading,
    required this.onTap,
  });



  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 200.w,
          height: 160.h,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: AppColors.softCardGrey,
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(
              color: AppColors.grey200,
            ),
          ),
          child: _buildImage(),
        ),

        Positioned(
          right: 12.w,
          bottom: -18.h,
          child: GestureDetector(
            onTap: isLoading ? null : onTap,
            child: Container(
              width: 52.w,
              height: 52.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.12),
                    blurRadius: 8.r,
                    offset: Offset(0, 3.h),
                  ),
                ],
              ),
              child: isLoading
                  ? AppLoadingIndicator(
  size: 23.w,
  strokeWidth: 2.3,
  color: AppColors.primaryBlue,
  centered: false,
)
                  : Icon(
                      Icons.photo_camera_rounded,
                      color: AppColors.primaryBlue,
                      size: 27.sp,
                    ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    if (localImage != null) {
      return Image.file(
        localImage!,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }

  final completeUrl =
    AppHelper.buildImageUrl(imageUrl);

    if (completeUrl.isNotEmpty) {
      return Image.network(
        completeUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (_, __, ___) {
          return const EmptyProfilePicture();
        },
      );
    }

    return const EmptyProfilePicture();
  }

}