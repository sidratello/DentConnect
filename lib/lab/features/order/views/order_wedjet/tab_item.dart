

import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class TabItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const TabItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.ibmBold22NeutralStyle.copyWith(
              color: isSelected ? AppColors.darkBlue : Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 3,
            width: 75,
            color: isSelected ? AppColors.darkBlue : Colors.transparent,
          ),
        ],
      ),
    );
  }
}