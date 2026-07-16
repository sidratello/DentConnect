import 'package:flutter/material.dart';


import 'package:template/core/widgets/app_page_header_cases.dart';

class LabOrderHeaderWidget extends StatelessWidget {
  const LabOrderHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPageHeader(
      title: 'الطلبات المنتظرة',
      subtitle: 'عرض جميع الطلبات التي تنتظر المراجعة أو القبول',
      imagePath: 'assets/images/tooth.png',
    );
  }
}