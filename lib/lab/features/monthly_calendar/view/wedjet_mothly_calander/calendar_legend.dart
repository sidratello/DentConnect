import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class CalendarLegend
    extends StatelessWidget {
  const CalendarLegend({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      alignment: WrapAlignment.center,
      spacing: 20,
      runSpacing: 8,
      children: [
        _LegendItem(
          title: 'طلبات الأطباء',
          color: AppColors.primaryBlue,
        ),
        _LegendItem(
          title: 'حجوزات المسح',
          color: AppColors.green,
        ),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final String title;
  final Color color;

  const _LegendItem({
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          title,
          style: AppTextStyles
              .ibmRegular12DarkStyle
              .copyWith(
            color: AppColors.normalText,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}