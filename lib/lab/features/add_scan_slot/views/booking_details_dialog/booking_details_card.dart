import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class BookingDetailsCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const BookingDetailsCard({
    super.key,
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.grey200,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withOpacity(
                0.045,
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: AppColors.primaryBlue,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: AppTextStyles
                      .ibmRegular14NeutralStyle
                      .copyWith(
                    color: AppColors.darkBlue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 5,
            ),
            child: Column(
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}