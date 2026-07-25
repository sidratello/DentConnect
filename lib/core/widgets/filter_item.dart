import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class FilterItem extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  final double fontSize;
  final double borderRadius;
  final Duration animationDuration;

  const FilterItem({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
    this.fontSize = 14,
    this.borderRadius = 14,
    this.animationDuration =
        const Duration(milliseconds: 220),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationDuration,
      decoration: BoxDecoration(
        color: selected
            ? AppColors.primaryBlue
            : Colors.transparent,
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
        boxShadow: selected
            ? [
                BoxShadow(
                  color: AppColors.primaryBlue
                      .withOpacity(0.20),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles
                  .ibmRegular14NeutralStyle
                  .copyWith(
                color: selected
                    ? AppColors.white
                    : AppColors.darkBlue,
                fontWeight: selected
                    ? FontWeight.w700
                    : FontWeight.w600,
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}