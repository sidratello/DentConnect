import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/lab/features/case_orders/views/widget/InfoRow.dart';

class LabAdStatusChip
    extends StatelessWidget {
  final bool isActive;
  final bool isPaid;

  const LabAdStatusChip({
    super.key,
    required this.isActive,
    required this.isPaid,
  });

  @override
  Widget build(BuildContext context) {
    if (isActive) {
      return const CaseOrderIconText(
        icon: Icons
            .check_circle_outline_rounded,
        text: 'نشط',
        iconColor: AppColors.green,
        textColor: AppColors.green,
        background: Color(0xFFE6F8EC),
        isChip: true,
        expandText: false,
      );
    }

    if (!isPaid) {
      return const CaseOrderIconText(
        icon:
            Icons.hourglass_bottom_rounded,
        text: 'في انتظار الدفع',
        iconColor:
            AppColors.urgentText,
        textColor:
            AppColors.urgentText,
        background:
            AppColors.urgentBackground,
        isChip: true,
        expandText: false,
      );
    }

    return const CaseOrderIconText(
      icon: Icons.schedule_outlined,
      text: 'قيد التفعيل',
      iconColor:
          AppColors.normalText,
      textColor:
          AppColors.normalText,
      background:
          AppColors.normalBackground,
      isChip: true,
      expandText: false,
    );
  }
}