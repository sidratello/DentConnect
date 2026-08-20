import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class AppSummaryCard extends StatelessWidget {
  final String title;
  final int total;
  final Widget leftWidget;
  final Widget rightWidget;
  final Color totalColor;

  const AppSummaryCard({
    super.key,
    required this.title,
    required this.total,
    required this.leftWidget,
    required this.rightWidget,
    this.totalColor = AppColors.primaryBlue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      padding: const EdgeInsets.symmetric(horizontal: 22),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.littleBlue.withOpacity(0.35),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkBlue.withOpacity(0.06),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Center(child: leftWidget),

          const SizedBox(width: 24),

          Container(
            width: 1,
            height: 45,
            color: AppColors.grey400.withOpacity(0.35),
          ),

          const Spacer(),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                  color: AppColors.darkBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    '$total',
                    style: AppTextStyles.ibmBold22NeutralStyle.copyWith(
                      color: totalColor,
                      fontSize: 26,
                      height: 1,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'طلبات',
                    style: AppTextStyles.ibmRegular12DarkStyle.copyWith(
                      color: totalColor,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(width: 16),

          rightWidget,
        ],
      ),
    );
  }
}