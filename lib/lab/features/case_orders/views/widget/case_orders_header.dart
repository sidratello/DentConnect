import 'package:flutter/material.dart';

import 'package:template/core/widgets/app_page_header_cases.dart';

class CaseOrdersHeader extends StatelessWidget {
  final String statusTitle;

  const CaseOrdersHeader({
    super.key,
    required this.statusTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppPageHeader(
  title: 'طلبات الحالة',
  subtitle:"عرض الطليات لهذه الحالة فقط",
  imagePath: 'assets/images/tooth.png',

    );
  }
}