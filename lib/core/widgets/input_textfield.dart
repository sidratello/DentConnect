import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class AuthInputField extends StatelessWidget {

  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
final String? Function(String?)? validator;
  const AuthInputField({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
height: 60,
      child: Directionality(
          textDirection: TextDirection.rtl,
        child: TextFormField(
          validator: validator,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          style: AppTextStyles.ibmRegular16WhiteStyle.copyWith(color: AppColors.textDark),
          decoration: InputDecoration(
             labelText: hintText,
            hintTextDirection: TextDirection.rtl,
            hintStyle: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
              color: AppColors.textDark.withOpacity(0.7),
            ),
            filled: true,
            fillColor: const Color(0xFFE8E8E8),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFD0D0D0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.primaryBlue),
            ),
             errorStyle: const TextStyle(
    color: AppColors.red,
    fontSize: 11,
    height: 0.10,
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
  }
}