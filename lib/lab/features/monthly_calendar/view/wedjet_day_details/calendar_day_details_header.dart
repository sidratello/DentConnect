import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:template/core/widgets/app_page_header_cases.dart';

class CalendarDayDetailsHeader
    extends StatelessWidget {
  final DateTime date;

  const CalendarDayDetailsHeader({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return AppPageHeader(
      title: 'تفاصيل يوم',
      subtitle: _formatDate(date),
      icon:
          Icons.calendar_month_outlined,
    );
  }

  String _formatDate(DateTime date) {
    return DateFormat(
      'EEEE، d MMMM yyyy',
      'ar',
    ).format(date);
  }
}