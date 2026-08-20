import 'package:flutter/material.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/utils/static.dart';

class CustomMultilineField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;

  const CustomMultilineField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
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
          maxLines: 5,
          style: const TextStyle(
            fontFamily: "IBM Plex Sans Arabic",
          ),
          decoration: InputDecoration(
            hintText: hint,
            alignLabelWithHint: true,
            filled: true,
            fillColor: AppColors.backgroundColor,
            contentPadding: EdgeInsets.all(
              Static.getwidth(context, 16),
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
