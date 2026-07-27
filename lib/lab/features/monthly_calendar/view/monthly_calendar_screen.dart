import 'package:flutter/material.dart';

import 'package:template/lab/features/monthly_calendar/view/wedjet_mothly_calander/monthly_calendar_body.dart';
import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';

class MonthlyCalendarScreen
    extends StatelessWidget {
  const MonthlyCalendarScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
  

    return const LabBackgroundLayout(
      child: MonthlyCalendarBody(),
    );
  }
}