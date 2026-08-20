import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/widgets/app_page_header_cases.dart';

import '../../controller/create_lab_ad_controller.dart';

class CreateLabAdHeader
    extends GetView<CreateLabAdController> {
  const CreateLabAdHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppPageHeader(
      title: 'طلب إعلان جديد',
      subtitle:
          'أرسل إعلان مخبرك للمراجعة والتفعيل',
      icon:
          Icons.campaign_outlined,
      onBack: controller.goBack,
    );
  }
}