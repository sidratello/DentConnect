import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/widgets/app_page_header_cases.dart';

import '../../controller/lab_complaints_controller.dart';

class LabComplaintsHeader
    extends StatelessWidget {
  const LabComplaintsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<
            LabComplaintsController>();

    return AppPageHeader(
      title: 'الشكاوى',
      subtitle:
          'متابعة شكاوى الأطباء والرد عليها',
      icon:
          Icons.report_problem_outlined,
      onBack:
          controller.goBack,
    );
  }
}