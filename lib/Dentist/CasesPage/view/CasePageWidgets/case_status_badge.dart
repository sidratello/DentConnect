import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../model/case_status.dart';

class CaseStatusBadge extends StatelessWidget {
  final CaseStatus status;

  const CaseStatusBadge({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    late String text;
    late Color color;

    switch (status) {
      case CaseStatus.waitingApproval:
        text = 'بانتظار الموافقة';
        color = AppColors.statusWaitingApproval;
        break;

      case CaseStatus.accepted:
        text = 'مقبولة';
        color = AppColors.statusAccepted;
        break;

      case CaseStatus.needInfo:
        text = 'تحتاج معلومات إضافية';
        color = AppColors.statusNeedInfo;
        break;

      case CaseStatus.inDesign:
        text = 'قيد التصميم';
        color = AppColors.statusInDesign;
        break;

      case CaseStatus.inProgress:
        text = 'قيد التنفيذ';
        color = AppColors.statusInProgress;
        break;

      case CaseStatus.ready:
        text = 'جاهزة';
        color = AppColors.statusReady;
        break;

      case CaseStatus.delivered:
        text = 'تم التسليم';
        color = AppColors.statusDelivered;
        break;

      case CaseStatus.cancelled:
        text = 'ملغاة';
        color = AppColors.statusCancelled;
        break;
    }
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
