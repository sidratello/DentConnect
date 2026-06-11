import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/profile/controller/editprofilecontroller.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/material_input.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/profile_checkbox_wrap.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/profile_chexk_box.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/section_card.dart';

class SpecialtiesSection extends StatelessWidget {
    final EditLabProfileController controller;
  const SpecialtiesSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
      final specialties = [
      'فينير',
      'زيركون',
      'إيماكس',
      'أكريليك',
      'بدلات متحركة',
'تيجان و جسور',
'الخزف التجميلي',
'التعويضات على الزرعات',
'الأطقم الكاملة',
'إصلاح وصيانة الأطقم السنية',
'التلوين والتجميل',
'التصميم الرقمي CAD/CAM',
'الهياكل المعدنية',

    ];




    return 
ProfileSectionCard(
  title: 'الاختصاصات والمواد',
  children: [
    Text(
      'اختصاصات المخبري:',
      style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
        fontWeight: FontWeight.w700,
      ),
    ),

    SizedBox(height: 8.h),

       
   
  ProfileCheckBoxWrap(
    items: specialties,
    selectedItems: controller.selectedSpecialties,
    onTap: controller.toggleSpecialty,
  ),

       

    SizedBox(height: 16.h),

MaterialsInputBox(controller: controller),
SizedBox(height: 8.h),





    SizedBox(height: 26.h),

Text(
      'حالة المخبري',
      style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
        fontWeight: FontWeight.w700,
      ),
    ),



Obx(() {
  return Column(
    children: [
      RadioItem(
        title: 'متاح',
        value: 0,
        groupValue: controller.availability.value,
        onChanged: (value) {
          controller.changeAvailability(value!);
        },
      ),

      RadioItem(
        title: 'مشغول',
        value: 1,
        groupValue: controller.availability.value,
        onChanged: (value) {
          controller.changeAvailability(value!);
        },
      ),

      RadioItem(
        title: 'غير متاح',
        value: 2,
        groupValue: controller.availability.value,
        onChanged: (value) {
          controller.changeAvailability(value!);
        },
      ),


      SizedBox(height: 16.h),

Obx(() {
  return SwitchRow(
    title: 'خدمة المسح:',
    value: controller.hasScanVisitService.value,
    onChanged: controller.changeScanService,
  );
}),
    ],
  );
}),


  ],
);
  }
}