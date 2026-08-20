import 'package:flutter/material.dart';

import 'package:template/core/widgets/app_page_header_cases.dart';

class UpdateScanSlotHeader extends StatelessWidget {
  const UpdateScanSlotHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AppPageHeader(
      title: 'تعديل موعد المسح',
      subtitle: 'تعديل التاريخ والوقت والفترة',
      icon: Icons.calendar_month_outlined,
    );
  }
}