import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class CalendarWeekDaysHeader
    extends StatelessWidget {
  const CalendarWeekDaysHeader({
    super.key,
  });

  static const List<String> weekDays = [
    'الأحد',
    'الاثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة',
    'السبت',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: weekDays.map(
        (day) {
          return Expanded(
            child: Text(
              day,
              maxLines: 1,
              overflow:
                  TextOverflow.ellipsis,
              textAlign:
                  TextAlign.center,
              style: AppTextStyles
                  .ibmRegular12DarkStyle
                  .copyWith(
                color:
                    AppColors.normalText,
                fontWeight:
                    FontWeight.w600,
                fontSize: 10,
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}