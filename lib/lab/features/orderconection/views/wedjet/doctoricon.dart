import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class DoctorInitialIcon extends StatelessWidget {
  final String initial;

  const DoctorInitialIcon({
    super.key,
    required this.initial,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 86.w,
      height: 86.w,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          /// BIG CIRCLE
          Container(
            width: 78.w,
            height: 78.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xffD8C48A),
                width: 2.w,
              ),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Color(0xffEAEAF2),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.06),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Text(initial,
                style: AppTextStyles.ibmBold22NeutralStyle.copyWith(
                  fontSize: 38.sp,
                  color: AppColors.darkBlue,
                )),
          ),

          /// SMALL CIRCLE
          Positioned(
            bottom: 6.h,
            right: 4.w,
            child: Container(
              width: 22.w,
              height: 22.w,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff0A2F8F),
              ),
              child: Text(
                initial,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
