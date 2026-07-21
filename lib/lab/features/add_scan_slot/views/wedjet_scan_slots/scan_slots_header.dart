import 'package:flutter/material.dart';
import 'package:template/core/widgets/app_page_header_cases.dart';

class ScanSlotsHeader extends StatelessWidget {
  const ScanSlotsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AppPageHeader(
      title: 'مواعيد المسح',
      subtitle: 'إدارة المواعيد المتاحة والمحجوزة',
      icon: Icons.calendar_month_outlined,
    );
  }
}