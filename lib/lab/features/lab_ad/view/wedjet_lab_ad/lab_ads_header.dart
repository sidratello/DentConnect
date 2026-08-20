import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/widgets/app_page_header_cases.dart';

import '../../controller/lab_ads_controller.dart';

class LabAdsHeader
    extends GetView<LabAdsController> {
  const LabAdsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppPageHeader(
      title: 'إعلاناتي',
      subtitle:
          'إدارة إعلانات مخبرك ومتابعة حالتها',
      icon:
          Icons.campaign_outlined,
      onBack: controller.goBack,
    );
  }
}