import 'package:flutter/material.dart';

import '../../../../core_dentist/theme/app_colors.dart';
import '../../../../core_dentist/utils/static.dart';
import '../../../../core_dentist/widgets/app_spacing.dart';

class ComplaintPreviewCard extends StatelessWidget {
  const ComplaintPreviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Static.getwidth(context, 320),
      padding: EdgeInsets.all(
        Static.getwidth(context, 18),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(
              alpha: 0.04,
            ),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.report_problem_outlined,
            size: Static.getwidth(context, 42),
            color: Theme.of(context).colorScheme.primary,
          ),
          AppSpacing.height(context, 12),
          Text(
            'تقديم الشكاوى',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w700,
              fontSize: Static.getwidth(context, 18),
            ),
          ),
          AppSpacing.height(context, 10),
          Text(
            'يمكنك من خلال هذه الواجهة تقديم شكوى ومتابعتها، سواء كانت موجهة إلى مالك المنصة أو إلى أحد المخابر.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w400,
              fontSize: Static.getwidth(context, 14),
              color: AppColors.textSecondary,
            ),
          ),
          AppSpacing.height(context, 20),
          const _FeatureItem(
            icon: Icons.admin_panel_settings_outlined,
            title: 'تقديم شكوى إلى مالك المنصة',
          ),
          const _FeatureItem(
            icon: Icons.biotech_outlined,
            title: 'تقديم شكوى موجهة إلى مخبر',
          ),
          const _FeatureItem(
            icon: Icons.title_outlined,
            title: 'إضافة عنوان واضح للشكوى',
          ),
          const _FeatureItem(
            icon: Icons.description_outlined,
            title: 'إضافة تفاصيل ومعلومات الشكوى',
          ),
        ],
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const _FeatureItem({
    required this.icon,
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
            color: Theme.of(context).colorScheme.primary,
            size: 22,
          ),
          AppSpacing.width(context, 10),
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
