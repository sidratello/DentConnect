import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/widgets/app_page_header_cases.dart';

import '../../controller/subscription_plans_controller.dart';

class SubscriptionPlansHeader
    extends GetView<
        SubscriptionPlansController> {
  const SubscriptionPlansHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppPageHeader(
      title:
          'خطط الاشتراك',
      subtitle:
          'اختر مدة الاشتراك المناسبة لك',
      icon:
          Icons.workspace_premium_outlined,
      onBack:
          controller.goBack,
    );
  }
}