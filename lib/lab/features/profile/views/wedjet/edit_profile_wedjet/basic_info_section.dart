import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/lab/features/profile/controller/editprofilecontroller.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/profile_inputfield.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/section_card.dart';

class BasicInfoSection extends StatelessWidget {

   final EditLabProfileController controller;

  const BasicInfoSection({
    super.key,
    required this.controller,
  });


  @override
  Widget build(BuildContext context) {
    return
     ProfileSectionCard(
  title: 'المعلومات الأساسية',
  children: [
     ProfileInputField(
      label: 'اسم المخبر :',
      hintText: 'مخبر....',
          suffixIcon: Icons.business,
          controller: controller.namePlaceController,
    ),

    SizedBox(height: 10.h),

    ProfileInputField(
      label: 'الإيميل :',
      hintText: 'email@example.com',
      keyboardType: TextInputType.emailAddress,
      suffixIcon: 
        Icons.email,
        controller: controller.emailController,
        
    ),

    SizedBox(height: 10.h),
     ProfileInputField(
      label: ' رقم الجوال :',
      hintText: '09xxxxxxxx',
      suffixIcon: Icons.mobile_friendly,
      keyboardType: TextInputType.phone,
        controller: controller.phoneController,
    ),

    SizedBox(height: 10.h),
     ProfileInputField(
      label: 'العنوان:',
      hintText: 'دمشق - شارع عدنان المالكي ',
          suffixIcon: Icons.location_city,
           controller: controller.addressController,
    ),

    SizedBox(height: 10.h),

     ProfileInputField(
      label: 'المدينة:',
      hintText: 'دمشق',
          suffixIcon: Icons.location_city,
          controller: controller.cityController,
    ),

    SizedBox(height: 10.h),

     ProfileInputField(
      label: 'البلد :',
      hintText: 'سوريا',
          suffixIcon: Icons.flag,
          controller: controller.countryController,
    ),

    SizedBox(height: 10.h),

    ProfileInputField(
      label: 'الوصف :',
      hintText: 'اكتب وصفاً هنا...',
      maxLines: 4,
      suffixIcon: 
        Icons.description,
        controller: controller.descriptionController,
    ),

    SizedBox(height: 10.h),
ProfileInputField(
  label: 'سنوات الخبرة:',
  hintText: '16',
  keyboardType: TextInputType.number,
  suffixIcon: Icons.work,
  controller: controller.yearsController,
),
    SizedBox(height: 10.h),



  
  ],
);
  }
}