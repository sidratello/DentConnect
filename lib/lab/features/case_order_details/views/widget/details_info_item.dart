import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class DetailsInfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color? valueColor;

  const DetailsInfoItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // إضافة خطوط فاصلة رمادية خفيفة جهة اليسار والأسفل
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.grey.withOpacity(0.15),
            width: 2,
          ),
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.15),
            width: 2,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // لتوسيط المحتوى عمودياً داخل المربع
        children: [
          Icon(icon, color: AppColors.primaryBlue, size: 26),
          const SizedBox(height: 8),
          Text(
            title,
            style: AppTextStyles.ibmRegular12DarkStyle.copyWith(
              color: AppColors.normalText,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
              color: valueColor ?? AppColors.darkBlue,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}