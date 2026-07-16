import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/widgets/app_page_header_cases.dart';

import '../../controller/doctor_orders_controller.dart';

class DoctorOrdersHeader extends StatelessWidget {
  const DoctorOrdersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DoctorOrdersController>();

    return AppPageHeader(
      title: 'طلبات الطبيب',
      subtitle: controller.doctorName.isEmpty
          ? 'عرض جميع طلبات الطبيب'
          : 'عرض جميع طلبات د. ${controller.doctorName}',
      imagePath: 'assets/images/tooth.png',
    );
  }
}