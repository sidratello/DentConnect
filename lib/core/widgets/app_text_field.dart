import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../utils/static.dart';

class AppTextField extends StatelessWidget {
  final String hint;
  final int maxLines;

  const AppTextField({
    super.key,
    required this.hint,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.right,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: 'IBM Plex Sans Arabic',
          fontWeight: FontWeight.w400,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        filled: true,
        fillColor: Theme.of(context).shadowColor,
        contentPadding: EdgeInsets.symmetric(
          horizontal: Static.getwidth(context, 14),
          vertical: Static.getheight(context, 12),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.border,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.border,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
