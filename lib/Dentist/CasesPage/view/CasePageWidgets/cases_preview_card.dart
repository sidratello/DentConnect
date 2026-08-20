import 'package:flutter/material.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/widgets/app_spacing.dart';

import '../../../../core_dentist/utils/static.dart';

class CasesPreviewCard extends StatelessWidget {
  const CasesPreviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Static.getwidth(
          context,
          24,
        ),
      ),
      padding: EdgeInsets.all(
        Static.getwidth(
          context,
          18,
        ),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(
          18,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: 0.04,
            ),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            Icons.folder_copy_rounded,
            size: Static.getwidth(
              context,
              40,
            ),
            color: Theme.of(context).colorScheme.primary,
          ),
          AppSpacing.height(
            context,
            12,
          ),
          Text(
            'إدارة الحالات',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w700,
              fontSize: Static.getwidth(
                context,
                18,
              ),
            ),
          ),
          AppSpacing.height(
            context,
            8,
          ),
          Text(
            'هنا ستظهر جميع الحالات المرتبطة بك ومراحل تنفيذها داخل المخبر.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w400,
              fontSize: Static.getwidth(
                context,
                14,
              ),
              color: AppColors.textSecondary,
            ),
          ),
          AppSpacing.height(
            context,
            20,
          ),
          _StatusItem(
            icon: Icons.pending_actions,
            color: AppColors.statusWaitingApproval,
            title: 'بانتظار الموافقة',
          ),
          _StatusItem(
            icon: Icons.check_circle,
            color: AppColors.success,
            title: 'مقبولة',
          ),
          _StatusItem(
            icon: Icons.info_outline,
            color: AppColors.statusNeedInfo,
            title: 'تحتاج معلومات إضافية',
          ),
          _StatusItem(
            icon: Icons.design_services,
            color: AppColors.purple,
            title: 'قيد التصميم',
          ),
          _StatusItem(
            icon: Icons.precision_manufacturing,
            color: Theme.of(context).colorScheme.primary,
            title: 'قيد التنفيذ',
          ),
          _StatusItem(
            icon: Icons.inventory_2,
            color: AppColors.turquoise,
            title: 'جاهزة',
          ),
          _StatusItem(
            icon: Icons.star_rate_rounded,
            color: AppColors.yellowRate,
            title: 'تم التسليم ويمكن تقييمها',
          ),
          _StatusItem(
            icon: Icons.cancel,
            color: AppColors.lightRed,
            title: 'ملغاة',
          ),
        ],
      ),
    );
  }
}

class _StatusItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;

  const _StatusItem({
    required this.icon,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
            size: 22,
          ),
          AppSpacing.width(
            context,
            8,
          ),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
