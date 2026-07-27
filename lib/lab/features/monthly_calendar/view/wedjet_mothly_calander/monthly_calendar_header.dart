import 'package:flutter/material.dart';
import 'package:template/core/widgets/app_page_header_cases.dart';


class MonthlyCalendarHeader
    extends StatelessWidget {
  const MonthlyCalendarHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AppPageHeader(
      title: 'التقويم',
      subtitle:
          'متابعة الطلبات ومواعيد المسح',
      icon: Icons.calendar_month_rounded,
    );
  }
}