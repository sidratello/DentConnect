


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LabHomeBanner extends StatelessWidget {
  const LabHomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260.h,
      width:360.w,
      margin: EdgeInsets.symmetric(horizontal: 14.w, ),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26.r),

        image: const DecorationImage(
          image: AssetImage(
            'assets/images/photo_2026-05-23_12-05-09.jpg',
          ),
          fit: BoxFit.cover,
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.12),
            blurRadius: 28.r,
            offset: Offset(0, 8.h),
          ),
        ],
      ),
    );
  }
}