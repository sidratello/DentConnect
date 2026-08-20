import 'package:flutter/material.dart';
import 'package:template/core/widgets/app_page_header_cases.dart';

class AddScanSlotHeader extends StatelessWidget {
  const AddScanSlotHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPageHeader(
      title: 'إضافة موعد مسح ',
      subtitle: 'حدد التاريخ والوقت المناسب للموعد',
      imagePath: 'assets/images/tooth.png',
    );
  }
}