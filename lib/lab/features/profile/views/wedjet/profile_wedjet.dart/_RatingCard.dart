import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/profile/model/profile_modil.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/section_card.dart';

class RatingCard extends StatelessWidget {
  final LabProfileModel profile;

  const RatingCard({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final rating = profile.averageRating;

    return ProfileSectionCard(
  padding: EdgeInsets.all(14.w),

  children: [
    Row(
      children: [
        Column(
          children: [
            Text(
              'التقييم',
              style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
       
    SizedBox(height: 12.h),


        Text(
          rating.toStringAsFixed(1),
          style: AppTextStyles.ibmBold22NeutralStyle.copyWith(
            fontSize: 28.sp,
          ),
        ),

   ],
        ),
    
    Spacer(),  
         Row(
          children: List.generate(5, (index) {
            if (rating >= index + 1) {
              return const Icon(
                Icons.star,
                color: Colors.amber,
              );
            } else if (rating > index && rating < index + 1) {
              return const Icon(
                Icons.star_half,
                color: Colors.amber,
              );
            } else {
              return const Icon(
                Icons.star_border,
                color: Colors.amber,
              );
            }
          }),
        ),

        ],
    ),

    
  ],

);}}