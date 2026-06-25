


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/widgets/InfoText.dart';
import 'package:template/lab/features/profile/model/profile_modil.dart';
import 'package:template/lab/features/profile/views/wedjet/profile_wedjet.dart/chip.dart';

import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/section_card.dart';


class DescriptionCard extends StatelessWidget {
    final LabProfileModel profile;
 const DescriptionCard({
    super.key,
    required this.profile,
  });


  @override
  Widget build(BuildContext context) {
    return ProfileSectionCard(

      /// title of card
      title: 'الوصف',

      /// align all children to right
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        /// description text
         InfoText(
          profile.description.isNotEmpty
              ? profile.description
              : 'لا يوجد وصف',
        ),

        SizedBox(height: 12.h),

        /// experience chip


   ExperienceChip(
          title: 'عدد سنوات الخبرة: ${profile.yearsOfExperience}',
          icon: Icons.work_outline,
        ),
        
      ],
    );
  }
}