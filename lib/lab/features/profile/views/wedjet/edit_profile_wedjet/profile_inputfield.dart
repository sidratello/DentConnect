import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class ProfileInputField extends StatelessWidget {

  final String label;

  final String hintText;

  final int maxLines;

  final IconData? prefixIcon;

  final IconData? suffixIcon;

  final TextInputType keyboardType;
final TextEditingController? controller;
final String? Function(String?)? validator;
  const ProfileInputField({
    super.key,
    required this.label,
    required this.hintText,
    this.maxLines = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.controller,
      this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// label
        Text(
          '$label',
          style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
            color: AppColors.neutral1000,
            fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(height: 4.h),

        /// field
        TextFormField(
          maxLines: maxLines,
 controller: controller,
          keyboardType: keyboardType,
validator: validator,
          textAlign: TextAlign.right,

          textDirection: TextDirection.rtl,

          style: AppTextStyles.ibmRegular16WhiteStyle.copyWith(
            color: AppColors.textDark,
            fontWeight: FontWeight.w600,
          ),

          decoration: InputDecoration(

            hintText: hintText,

            hintTextDirection: TextDirection.rtl,

            hintStyle: AppTextStyles.ibmRegular16WhiteStyle.copyWith(
              color: AppColors.black54,
            ),

            /// prefix
            prefixIcon: prefixIcon == null
                ? null
                : Container(
                    width: 48.w,

                    alignment: maxLines > 1
                        ? Alignment.topCenter
                        : Alignment.center,

                    padding: EdgeInsets.only(
                      top: maxLines > 1 ? 14.h : 0,
                    ),

                    decoration: const BoxDecoration(
                      color: Color(0xFFE9EEF5),

                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                    ),

                    child: Icon(
                      prefixIcon,
                      color: AppColors.black54,
                      size: 24.sp,
                    ),
                  ),

            /// suffix
            suffixIcon: suffixIcon == null
                ? null
                : Icon(
                    suffixIcon,
                    color: AppColors.black54,
                    size: 22.sp,
                  ),

            filled: true,

            fillColor: AppColors.white,

            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: maxLines > 1 ? 16.h : 8.h,
            ),

            enabledBorder: _border(),

            focusedBorder: _border(
              color: AppColors.primaryBlue,
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _border({
    Color color = const Color(0xFF9E9E9E),
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),

      borderSide: BorderSide(
        color: color,
        width: 1.4,
      ),
    );
  }
}