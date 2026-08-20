import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'package:template/core/widgets/app_page_header_cases.dart';
import 'package:template/lab/features/case_orders/controller/case_orders_controller.dart';

class CaseOrdersHeader extends GetView<CaseOrdersController>{
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
onBack: controller.goBack,
    );
  }
}