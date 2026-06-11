import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/app_button.dart';
import 'package:template/lab/features/profile/controller/editprofilecontroller.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/profile_inputfield.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/section_card.dart';

class PricesEditSection extends StatelessWidget {
  final EditLabProfileController controller;

  const PricesEditSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileSectionCard(
      title: 'الخدمات والأسعار',
      children: [
        Form(
          key: controller.priceFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'نوع التعويض:',
                style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: 6.h),

              Obx(() {
                return DropdownButtonFormField<String>(
                  value: controller.selectedCompensationType.value,
                  isExpanded: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 10.h,
                    ),
                  ),
                  items: controller.compensationTypes.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  onChanged: (value) {
                    controller.selectedCompensationType.value = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'نوع التعويض مطلوب';
                    }
                    return null;
                  },
                );
              }),

              SizedBox(height: 10.h),

              ProfileInputField(
                label: 'السعر:',
                hintText: 'مثال: 100',
                keyboardType: TextInputType.number,
                suffixIcon: Icons.attach_money,
                controller: controller.unitPriceController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'السعر مطلوب';
                  }

                  final price = double.tryParse(value.trim());

                  if (price == null) {
                    return 'أدخل رقماً صحيحاً';
                  }

                  if (price < 0.01 || price > 1000000) {
                    return 'السعر يجب أن يكون بين 0.01 و 1000000';
                  }

                  return null;
                },
              ),

              SizedBox(height: 10.h),

              ProfileInputField(
                label: 'ملاحظات:',
                hintText: 'اختياري',
                suffixIcon: Icons.note,
                controller: controller.notesController,
              ),

              SizedBox(height: 14.h),

              AppButton(
                title: 'إضافة نوع تعويض جديد',
                type: AppButtonType.gradient,
                height: 52.h,
                onTap: controller.addPrice,
              ),
            ],
          ),
        ),
      ],
    );
  }
}