import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/lab/features/profile/controller/profilecontroller.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/profile_chexk_box.dart';
import 'package:template/lab/features/profile/views/wedjet/profile_wedjet.dart/_DescriptionCard.dart';
import 'package:template/lab/features/profile/views/wedjet/profile_wedjet.dart/_InfoCard.dart';
import 'package:template/lab/features/profile/views/wedjet/profile_wedjet.dart/_MaterialsCard.dart';
import 'package:template/lab/features/profile/views/wedjet/profile_wedjet.dart/_PricesCard.dart';
import 'package:template/lab/features/profile/views/wedjet/profile_wedjet.dart/_RatingCard.dart';
import 'package:template/lab/features/profile/views/wedjet/profile_wedjet.dart/_SpecialtiesCard.dart';
import 'package:template/lab/features/profile/views/wedjet/profile_wedjet.dart/_StatusCard.dart';
import 'package:template/lab/features/profile/views/wedjet/profile_wedjet.dart/_TopBar.dart';
import 'package:template/lab/features/profile/views/wedjet/profile_wedjet.dart/gallery_card.dart';

class LabProfileViewScreen extends StatelessWidget {
  const LabProfileViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final controller = Get.find<LabProfileController>();
          
    return Scaffold(
      backgroundColor: AppColors.background,
      body:
      
      
      
       SafeArea(

               child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

        final profile = controller.profile.value;

          if (profile == null) {
            return const Center(child: Text('لا توجد بيانات'));
          }
        return Column(
          children: [
    

            Expanded(
              child: SingleChildScrollView(

                child: Column(
                  children: [
                   LabProfileHeader(profile: profile),

    SizedBox(height: 30.h),
                     Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
          vertical: 10.h,
          
        ),
        child:Column(
          children: [
InfoCard(profile: profile),
                    SizedBox(height: 10.h),

                    StatusCard(profile: profile),

                    SizedBox(height: 10.h),

               DescriptionCard(profile: profile),

                    SizedBox(height: 10.h),

                SpecialtiesCard(profile: profile),

                    SizedBox(height: 10.h),

                MaterialsCard(profile: profile),

                    SizedBox(height: 10.h),

                RatingCard(profile: profile),

                    SizedBox(height: 10.h),

                    PricesCard(profile: profile),

                    SizedBox(height: 10.h),
SwitchRow(
  title: 'خدمة المسح الرقمي',
  value: profile.hasScanVisitService,
  readOnly: true,
),
                 GalleryCard(profile: profile),

SizedBox(height: 10.h),

                  ],
                ),
                   ),
    ],
              ),
            ),),
                  ],
          );
        }),
      ),
    );
  }
}