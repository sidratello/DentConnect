
import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
class SmallActionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const SmallActionButton({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 38,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.littleBlue.withOpacity(.7),
            width: 1.2,
          ),
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
           
      
            Icon(
              icon,
              color: AppColors.primaryBlue,
              size: 20,
            ),

      const SizedBox(width: 8),


             Text(
              title,
              style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                color: AppColors.darkBlue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}