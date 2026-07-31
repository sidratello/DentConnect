import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/app_colors.dart';

class EmptyProfilePicture extends StatelessWidget {
  const EmptyProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.softCardGrey,
      alignment: Alignment.center,
      child: Icon(
        Icons.add_photo_alternate_outlined,
        color: AppColors.primary200,
        size: 55.sp,
      ),
    );
  }
}