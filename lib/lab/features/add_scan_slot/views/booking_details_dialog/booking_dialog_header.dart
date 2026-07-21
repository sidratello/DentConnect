import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class BookingDialogHeader extends StatelessWidget {
  final VoidCallback onClose;

  const BookingDialogHeader({
    super.key,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        16,
        15,
        18,
        15,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue.withOpacity(
          0.06,
        ),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(22),
          topLeft: Radius.circular(22),
        ),
        border: Border(
          bottom: BorderSide(
            color: AppColors.littleBlue,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withOpacity(
                0.12,
              ),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.calendar_month_outlined,
              color: AppColors.primaryBlue,
              size: 23,
            ),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'تفاصيل الحجز',
                  style: AppTextStyles
                      .ibmMedium18NeutralStyle
                      .copyWith(
                    color: AppColors.darkBlue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'معلومات الموعد والطبيب والعيادة',
                  style: AppTextStyles
                      .ibmRegular12DarkStyle
                      .copyWith(
                    color: AppColors.normalText,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onClose,
            icon: const Icon(
              Icons.close_rounded,
              color: AppColors.normalText,
            ),
          ),
        ],
      ),
    );
  }
}