
import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/order/views/order_detals_wedjet/ToothInfo.dart';
class ToothCard extends StatelessWidget {
  final ToothInfo tooth;

  const ToothCard({
    required this.tooth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(.92),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.darkBlue,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black54,
            blurRadius: 8,
            offset: const Offset(1, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            tooth.imagePath,
            width: 42,
            height: 52,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'السن: ${tooth.toothNumber}',
                  style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'نوع التعويض:',
                  style: AppTextStyles.ibmRegular12DarkStyle.copyWith(
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Text(
                    
                  tooth.compensationType,
                  style: AppTextStyles.ibmRegular12DarkStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 9,
              
                 
                    
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}