import 'package:flutter/material.dart';
import 'package:template/core/theme/app_colors.dart';

import '../../../../core/utils/static.dart';
import '../../../../core/widgets/app_spacing.dart';

class CommunityPreviewCard extends StatelessWidget {
  const CommunityPreviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Static.getwidth(context, 24),
      ),
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
            Icons.forum_rounded,
            size: Static.getwidth(context, 42),
            color: AppColors.primaryBlue,
          ),
          AppSpacing.height(context, 12),
          Text(
            'المدونة العامة',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w700,
              fontSize: Static.getwidth(context, 18),
            ),
          ),
          AppSpacing.height(context, 10),
          Text(
            'مساحة مشتركة تجمع الأطباء والمخابر لتبادل الخبرات والأفكار ومشاركة الحالات والنتائج العملية.',
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
            icon: Icons.image_outlined,
            title: 'مشاركة صور للحالات والنتائج',
          ),
          const _FeatureItem(
            icon: Icons.edit_note_rounded,
            title: 'نشر منشورات ومعلومات طبية مفيدة',
          ),
          const _FeatureItem(
            icon: Icons.groups_rounded,
            title: 'الاطلاع على خبرات الأطباء والمخابر الأخرى',
          ),
          const _FeatureItem(
            icon: Icons.visibility_rounded,
            title: 'تصفح المحتوى المنشور من جميع المستخدمين',
          ),
          const _FeatureItem(
            icon: Icons.publish_rounded,
            title: 'إرسال منشوراتك للمراجعة قبل نشرها',
          ),
          AppSpacing.height(context, 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).shadowColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'شارك خبراتك، اعرض نتائج أعمالك، واستفد من تجارب الآخرين ضمن مجتمع مهني متخصص.',
              textAlign: TextAlign.center,
              style: TextStyle(
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
            size: 22,
            color: Theme.of(context).colorScheme.primary,
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
