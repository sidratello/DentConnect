import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class BookedAppointmentTimeChip
    extends StatelessWidget {
  final String timeFormatted;
  final String period;

  const BookedAppointmentTimeChip({
    super.key,
    required this.timeFormatted,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    final normalizedPeriod =
        period.toUpperCase();

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.littleBlue.withOpacity(
            0.7,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.schedule_rounded,
            color: AppColors.primaryBlue,
            size: 18,
          ),

          const SizedBox(width: 6),

          Text(
            _extractTime(timeFormatted),
            textDirection: TextDirection.ltr,
            style: AppTextStyles
                .ibmMedium18NeutralStyle
                .copyWith(
              color: AppColors.darkBlue,
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(width: 4),

          Text(
            normalizedPeriod,
            textDirection: TextDirection.ltr,
            style: AppTextStyles
                .ibmRegular14NeutralStyle
                .copyWith(
              color: AppColors.primaryBlue,
              fontSize: 10,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  String _extractTime(
    String value,
  ) {
    final match = RegExp(
      r'\d{1,2}:\d{2}',
    ).firstMatch(value);

    return match?.group(0) ?? value;
  }
}