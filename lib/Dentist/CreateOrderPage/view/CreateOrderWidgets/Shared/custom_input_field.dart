import 'package:flutter/material.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/static.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool enabled;

  const CustomInputField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.controller,
    this.keyboardType,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: "IBM Plex Sans Arabic",
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
            fontSize: Static.getwidth(context, 14),
          ),
        ),
        SizedBox(height: Static.getheight(context, 8)),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          enabled: enabled,
          style: const TextStyle(
            fontFamily: "IBM Plex Sans Arabic",
          ),
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(
              icon,
              color: AppColors.primary,
            ),
            filled: true,
            fillColor: AppColors.backgroundColor,
            contentPadding: EdgeInsets.symmetric(
              vertical: Static.getheight(context, 16),
              horizontal: Static.getwidth(context, 16),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.border,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.border,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1.4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
