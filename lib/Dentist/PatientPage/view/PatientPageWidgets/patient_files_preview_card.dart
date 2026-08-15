import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/static.dart';
import '../../../../core/widgets/app_spacing.dart';

class PatientFilesPreviewCard extends StatelessWidget {
  const PatientFilesPreviewCard({
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
            Icons.folder_shared_rounded,
            size: Static.getwidth(context, 42),
            color: Theme.of(context).colorScheme.primary,
          ),
          AppSpacing.height(context, 12),
          Text(
            'ملفات المرضى',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w700,
              fontSize: Static.getwidth(context, 18),
            ),
          ),
          AppSpacing.height(context, 10),
          Text(
            'احتفظ بملف متكامل لكل مريض للوصول السريع إلى معلوماته وصوره ومتابعة حالته بسهولة.',
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
            icon: Icons.person_outline,
            title: 'حفظ معلومات المرضى',
          ),
          const _FeatureItem(
            icon: Icons.medical_information_outlined,
            title: 'إضافة الملاحظات السريرية',
          ),
          const _FeatureItem(
            icon: Icons.image_outlined,
            title: 'حفظ صور الأسنان الحالية',
          ),
          const _FeatureItem(
            icon: Icons.monitor_heart_outlined,
            title: 'إرفاق صور الأشعة',
          ),
          const _FeatureItem(
            icon: Icons.history,
            title: 'الرجوع للحالات السابقة بسهولة',
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
