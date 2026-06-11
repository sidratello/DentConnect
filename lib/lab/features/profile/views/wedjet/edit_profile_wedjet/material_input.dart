




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/profile/controller/editprofilecontroller.dart';
import 'package:template/lab/features/profile/views/wedjet/profile_wedjet.dart/chip.dart';

class MaterialsInputBox extends StatelessWidget {
  final EditLabProfileController controller;

  const MaterialsInputBox({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'المواد المستخدمة:',
          style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(height: 6.h),

        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: Colors.grey,
              width: 1.4,
            ),
          ),
          child: Obx(() {
            return Wrap(
              spacing: 6.w,
              runSpacing: 6.h,
              crossAxisAlignment: WrapCrossAlignment.center,
              textDirection: TextDirection.rtl,
              children: [
                SizedBox(
                  width: 110.w,
                  child: TextField(
                    controller: controller.materialController,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    decoration: const InputDecoration(
                      hintText: 'إضافة مادة',
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    onSubmitted: (_) => controller.addMaterial(),
                  ),
                ),

                ...controller.selectedMaterials.map((material) {
                  return ExperienceChip(
                    title: material,
                    onDelete: () {
                      controller.removeMaterial(material);
                    },
                  );
                }),

               
              ],
            );
          }),
        ),
      ],
    );
  }
}