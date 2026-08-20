import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/widgets/app_page_header_cases.dart';

import '../../controller/lab_ad_feed_controller.dart';

class LabAdFeedHeader
    extends StatelessWidget {
  const LabAdFeedHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<
            LabAdFeedController>();

    return AppPageHeader(
      title: 'الإعلانات',
      subtitle:
          'أحدث العروض والإعلانات المتاحة لك',
      icon:
          Icons.campaign_outlined,
      onBack:
          controller.goBack,
    );
  }
}