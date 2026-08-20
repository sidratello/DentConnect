import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class LabMenuItemWidget<T>
    extends PopupMenuItem<T> {
  LabMenuItemWidget({
    super.key,
    required T value,
    required IconData icon,
    required String title,
    required String subtitle,
  }) : super(
          value: value,
          height: 72.h,
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  color: AppColors.littleBlue
                      .withOpacity(.35),
                  borderRadius:
                      BorderRadius.circular(
                    12.r,
                  ),
                ),
                child: Icon(
                  icon,
                  color:
                      AppColors.primaryBlue,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  mainAxisSize:
                      MainAxisSize.min,
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles
                          .ibmBold22NeutralStyle
                          .copyWith(
                        color:
                            AppColors.darkBlue,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      subtitle,
                      style: AppTextStyles
                          .ibmRegular14NeutralStyle
                          .copyWith(
                        color: AppColors
                            .normalText,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
}