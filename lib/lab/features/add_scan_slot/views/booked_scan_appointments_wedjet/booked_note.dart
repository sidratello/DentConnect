import 'package:flutter/material.dart';

import '../../../../../../core/app_colors.dart';
import '../../../../../../core/app_text_styles.dart';

class BookedAppointmentsNote
    extends StatelessWidget {
  const BookedAppointmentsNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue
            .withOpacity(0.06),
        borderRadius:
            BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration:
                const BoxDecoration(
              color: AppColors.primaryBlue,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.info_outline_rounded,
              color: AppColors.white,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'يتم تحديث المواعيد المحجوزة تلقائياً عند قيام الأطباء بحجز موعد جديد .',
              style: AppTextStyles
                  .ibmRegular14NeutralStyle
                  .copyWith(
                color: AppColors.darkBlue,
                height: 1.6,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}