import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/widgets/app_page_header_cases.dart';

import '../../controller/lab_subscription_controller.dart';

class LabSubscriptionHeader
    extends GetView<
        LabSubscriptionController> {
  const LabSubscriptionHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppPageHeader(
      title:
          'الاشتراك',
      subtitle:
          'إدارة حالة اشتراك المخبر',
      icon:
          Icons.workspace_premium_outlined,
      onBack:
          controller.goBack,
    );
  }
}