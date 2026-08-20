import 'package:flutter/material.dart';

import 'package:template/core/widgets/app_page_header_cases.dart';


class CaseStatusHeader extends StatelessWidget {
  const CaseStatusHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return 
   const AppPageHeader(
  title: 'إدارة الحالات',
  subtitle: 'عرض عدد الطلبات حسب كل حالة',
  imagePath: 'assets/images/tooth.png',
);

}}