import 'package:flutter/material.dart';
import 'package:template/lab/features/monthly_calendar/view/wedjet_day_details/day_details_body.dart';

import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';

class CalendarDayDetailsScreen
    extends StatelessWidget {
  const CalendarDayDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const LabBackgroundLayout(
      child:
          CalendarDayDetailsBody(),
    );
  }
}