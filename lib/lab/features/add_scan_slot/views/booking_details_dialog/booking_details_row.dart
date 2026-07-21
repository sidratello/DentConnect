import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class BookingDetailsRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? value;
  final TextDirection? valueTextDirection;

  const BookingDetailsRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.valueTextDirection,
  });

  @override
  Widget build(BuildContext context) {
    final displayedValue = _displayedValue;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 11,
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withOpacity(
                0.07,
              ),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(
              icon,
              color: AppColors.primaryBlue,
              size: 18,
            ),
          ),
          const SizedBox(width: 10),
          // Expanded(
          //   flex: 2,
          //   child: Text(
          //     label,
          //     style: AppTextStyles
          //         .ibmRegular12DarkStyle
          //         .copyWith(
          //       color: AppColors.normalText,
          //       fontWeight: FontWeight.w600,
          //     ),
          //   ),
          // ),
          const SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: Directionality(
              textDirection:  TextDirection.rtl,
              child: Text(
                displayedValue,
                textAlign: TextAlign.start,
                textDirection:
                    valueTextDirection,
                style: AppTextStyles
                    .ibmRegular14NeutralStyle
                    .copyWith(
                  color: AppColors.darkBlue,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String get _displayedValue {
    final normalizedValue = value?.trim();

    if (normalizedValue == null ||
        normalizedValue.isEmpty) {
      return 'غير متوفر';
    }

    return normalizedValue;
  }
}