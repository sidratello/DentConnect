/// lab_profile_body.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:template/lab/features/profile/controller/editprofilecontroller.dart';

import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/Specialties_Section.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/basic_info_section.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/gallery_edit_section.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/lab_profile_picture/lab_profile_picture_section.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/price_edit_section.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/prices_edit_card.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/my_fatoorah_code_edit_card.dart';




class LabProfileBody extends StatelessWidget {
  const LabProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
      final controller = Get.find<EditLabProfileController>();
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 20.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

     

      
LabProfilePictureSection(
  controller: controller,
),

SizedBox(height: 16.h),
    BasicInfoSection(controller: controller),
SizedBox(height: 16.h),
SpecialtiesSection(controller: controller),
SizedBox(height: 16.h),

PricesEditSection(controller: controller),
PricesEditCard(
  controller: controller,
),
SizedBox(height: 16.h),

MyFatoorahCodeEditCard(
  controller: controller,
),
SizedBox(height: 16.h),

GalleryEditSection(controller: controller),


        ],
      ),
    );
  }
}