


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/app_button.dart';
import 'package:template/lab/features/profile/model/profile_modil.dart';


class StatusCard extends StatelessWidget {
   final LabProfileModel profile;
     const StatusCard({
    super.key,
    required this.profile,
  });
  @override
  Widget build(BuildContext context) {
       final bool isAvailable = profile.availability == 'Available';
    return Column(
      children: [
    AppButton(
title: isAvailable ? 'متاح للعمل ●' : 'غير متاح للعمل ●',

  onTap: () {},

  height: 60.h,

   backgroundColor: isAvailable ? Colors.green : Colors.red,

  textStyle: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
  color: Colors.white,
  fontWeight: FontWeight.bold,
),
),

      ],
    );
  }
}