import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final IconData icon;

  const SectionTitle({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Icon(
          icon,
          color: AppColors.primaryBlue,
          size: 22,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.right,
            style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
              color: AppColors.darkBlue,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}