// 

import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class AuthInputField extends StatelessWidget {
  final String hintText;
  final String? title;

  final TextEditingController? controller;
  final String? initialValue;

  final TextInputType keyboardType;
  final bool obscureText;
  final bool readOnly;
  final bool enabled;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;

  final int maxLines;
  final double height;

  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;

  const AuthInputField({
    super.key,
    required this.hintText,
    this.title,
    this.controller,
    this.initialValue,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onTap,
    this.onChanged,
    this.maxLines = 1,
    this.height = 60,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
  }) : assert(
          controller == null || initialValue == null,
          'لا يمكن استخدام controller و initialValue معًا',
        );

  @override
  Widget build(BuildContext context) {
    final field = SizedBox(
      height: maxLines == 1 ? height : null,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          controller: controller,
          initialValue: controller == null ? initialValue : null,
          validator: validator,
          keyboardType: keyboardType,
          obscureText: obscureText,
          readOnly: readOnly,
          enabled: enabled,
          onTap: onTap,
          onChanged: onChanged,
          maxLines: obscureText ? 1 : maxLines,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          style: AppTextStyles.ibmRegular16WhiteStyle.copyWith(
            color: AppColors.textDark,
          ),
          decoration: InputDecoration(
            labelText: hintText,
            hintText: hintText,
            hintTextDirection: TextDirection.rtl,
            hintStyle: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
              color: AppColors.textDark.withOpacity(.7),
            ),
            labelStyle: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
              color: AppColors.normalText,
            ),
            floatingLabelStyle:
                AppTextStyles.ibmRegular14NeutralStyle.copyWith(
              color: AppColors.primaryBlue,
              fontWeight: FontWeight.w600,
            ),
            filled: true,
            fillColor: fillColor ?? const Color(0xFFE8E8E8),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: borderColor ?? const Color(0xFFD0D0D0),
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: borderColor ?? const Color(0xFFD0D0D0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: focusedBorderColor ?? AppColors.primaryBlue,
                width: 1.3,
              ),
            ),
            errorStyle: const TextStyle(
              color: AppColors.red,
              fontSize: 11,
              height: .8,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.red,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.red,
                width: 1,
              ),
            ),
          ),
        ),
      ),
    );

    if (title == null || title!.trim().isEmpty) {
      return field;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          textAlign: TextAlign.right,
          style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
            color: AppColors.darkBlue,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 9),
        field,
      ],
    );
  }
}