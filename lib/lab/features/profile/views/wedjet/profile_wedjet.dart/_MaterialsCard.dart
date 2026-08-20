





import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/profile/model/profile_modil.dart';
import 'package:template/lab/features/profile/views/wedjet/profile_wedjet.dart/chip.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/section_card.dart';

class MaterialsCard extends StatelessWidget {
    final LabProfileModel profile;

  const MaterialsCard({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
  final materials = profile.materials;

    return ProfileSectionCard(
  title: 'المواد المستخدمة',
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    if (materials.isEmpty)
      Text(
        'لا توجد مواد',
        style: AppTextStyles.ibmRegular14NeutralStyle,
      )
    else
      Wrap(
        spacing: 8.w,
        runSpacing: 8.h,
      children: materials
    .where((material) => material != '[]')
    .map((material) {
      return ExperienceChip(
        title: material,
      );
    })
    .toList(),
      ),
  ],
);
  }
}