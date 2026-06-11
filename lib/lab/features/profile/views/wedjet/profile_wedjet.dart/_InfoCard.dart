




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/profile/model/profile_modil.dart';

import 'package:template/lab/features/profile/views/wedjet/profile_wedjet.dart/info_text.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/section_card.dart';
class InfoCard extends StatelessWidget {
  final LabProfileModel profile;

  const InfoCard({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final owner = profile.owner;

    return ProfileSectionCard(
      title: null,
      padding: EdgeInsets.all(12.w),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
       

            SizedBox(width: 12.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${owner.name} - فني تعويضات سنية',
                    textAlign: TextAlign.right,
                    style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
  fontWeight: FontWeight.bold,
)
                  ),

                  SizedBox(height: 6.h),

                  InfoText('البريد الإلكتروني: ${owner.email}'),
                  InfoText('رقم الهاتف: ${owner.phone}'),
                  InfoText('اسم المخبر: ${owner.namePlace}'),
                  InfoText('العنوان: ${owner.addressPlace}'),
                  InfoText('المدينة: ${owner.cityPlace}'),
                  InfoText('البلد: ${owner.countryPlace}'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}