import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/lab/features/case_status/controller/case_status_controller.dart';
import 'package:template/lab/features/case_status/views/widget/custom_total_order.dart';

class CaseStatusTotalCard extends StatelessWidget {
  const CaseStatusTotalCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CaseStatusController>();

    return Obx(() {
      final total = controller.statuses.fold<int>(
        0,
        (sum, item) => sum + item.count,
      );

      return AppSummaryCard(
        title: 'إجمالي الطلبات',
        total: total,
        leftWidget: Image.asset(
          'assets/images/analytics.png',
          width: 45,
          height: 45,
        ),
        rightWidget: Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: AppColors.primaryBlue.withOpacity(0.08),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.assignment_outlined,
            color: AppColors.primaryBlue,
            size: 27,
          ),
        ),
      );
    });
  }
}