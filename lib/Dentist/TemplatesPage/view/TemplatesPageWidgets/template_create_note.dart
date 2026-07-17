import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/static.dart';

class TemplateCreateNote extends StatelessWidget {
  const TemplateCreateNote({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 5,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: 'ملاحظات ثابتة',
        hintStyle: const TextStyle(
          fontFamily: 'IBM Plex Sans Arabic',
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
        ),
        filled: true,
        fillColor: const Color.fromRGBO(232, 232, 232, 1),
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
