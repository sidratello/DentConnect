import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/widgets/app_page_header_cases.dart';

import '../../controller/lab_ad_details_controller.dart';

class LabAdDetailsHeader
    extends GetView<
        LabAdDetailsController> {
  const LabAdDetailsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppPageHeader(
      title: 'تفاصيل الإعلان',
      subtitle:
          'معلومات الإعلان وحالته',
      icon: Icons.campaign_outlined,
      onBack: controller.goBack,
    );
  }
}