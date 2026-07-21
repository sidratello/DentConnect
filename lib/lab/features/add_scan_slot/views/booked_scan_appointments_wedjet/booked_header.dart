import 'package:flutter/material.dart';

import 'package:template/core/widgets/app_page_header_cases.dart';

class BookedAppointmentsHeader
    extends StatelessWidget {
  const BookedAppointmentsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AppPageHeader(
      title: 'المواعيد المحجوزة',
      subtitle:
          'عرض المواعيد التي حجزها الأطباء',
      icon:
          Icons.calendar_month_outlined,
    );
  }
}