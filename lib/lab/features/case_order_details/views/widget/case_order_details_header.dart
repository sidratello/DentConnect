import 'package:flutter/material.dart';

import 'package:template/core/widgets/app_page_header_cases.dart';

class CaseOrdersdetalsHeader
    extends StatelessWidget {
  final VoidCallback onBack;

  const CaseOrdersdetalsHeader({
    super.key,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppPageHeader(
      title: 'تفاصيل الطلب',
      subtitle:
          'جميع معلومات الطلب وتفاصيله في مكان واحد',
      imagePath:
          'assets/images/tooth.png',
      onBack: onBack,
    );
  }
}