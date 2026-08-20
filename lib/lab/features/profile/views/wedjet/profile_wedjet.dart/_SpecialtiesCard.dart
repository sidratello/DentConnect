import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/lab/features/profile/model/profile_modil.dart';
import 'package:template/lab/features/profile/views/wedjet/profile_wedjet.dart/chip.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/section_card.dart';



class SpecialtiesCard extends StatelessWidget {
  final LabProfileModel profile;

  const SpecialtiesCard({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {

final items = profile.specialties;

    return ProfileSectionCard(

      /// card title
      title: 'اختصاصات المخبري',

      /// align children to right
      crossAxisAlignment: CrossAxisAlignment.start,

     children: [
        if (items.isEmpty)
          const Text('لا توجد اختصاصات')
        else
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            alignment: WrapAlignment.start,
            children: items.map((e) {
              return ExperienceChip(
                title: e,
                icon: Icons.medical_services_outlined,
              );
            }).toList(),
          ),
      ],
    );
  }
}

