import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:template/core/app_helper.dart';
import 'package:template/core/app_router.dart';
import 'package:template/lab/features/profile/controller/profilecontroller.dart';


import 'package:template/lab/features/profile/model/profile_modil.dart';
class LabProfileHeader extends StatelessWidget {
  final LabProfileModel profile;
  final String profilePictureUrl;
  const LabProfileHeader({
    super.key,
    required this.profile,
     required this.profilePictureUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
         SizedBox(
  height: 370.h,
  width: double.infinity,
  child: ClipRRect(
borderRadius: BorderRadius.only(
  bottomRight: Radius.circular(30.r),
  bottomLeft: Radius.circular(30.r),
),
    child: _buildBackgroundImage(),
  ),
),

          Positioned(
            top: 40.h,
            left: 16.w,
            child: GestureDetector(
              onTap: Get.back,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          Positioned(
            top: 40.h,
            right: 16.w,
            child: PopupMenuButton<String>(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
             onSelected: (value) async {
  if (value == 'edit') {
    await Get.toNamed(
      AppRouter.editProfile,
      arguments: profile,
    );

    if (Get.isRegistered<LabProfileController>()) {
      await Get.find<LabProfileController>()
          .refreshProfilePicture();
    }
  }
},
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<String>(
                    value: 'edit',
                    child: Text('تعديل الملف الشخصي'),
                  ),
                ];
              },
               
              
            ),
          ),

          // صورة الطبيب
          Positioned(
            bottom: -30,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/images/photo_2026-06-08_13-25-46-removebg-preview.png',
                height: 120.h,
              ),
            ),
          ),
        
        ],
      ),
    );
  }
    Widget _buildBackgroundImage() {
final String completeUrl =
    AppHelper.buildImageUrl(profilePictureUrl);

    if (completeUrl.isEmpty) {
      return _buildDefaultImage();
    }

    return Image.network(
      completeUrl,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
      loadingBuilder: (
        context,
        child,
        loadingProgress,
      ) {
        if (loadingProgress == null) {
          return child;
        }

        return _buildDefaultImage();
      },
      errorBuilder: (
        context,
        error,
        stackTrace,
      ) {
        return _buildDefaultImage();
      },
    );
  }

  Widget _buildDefaultImage() {
    return Image.asset(
      'assets/images/photo_2026-06-08_13-10-19.jpg',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }



}
