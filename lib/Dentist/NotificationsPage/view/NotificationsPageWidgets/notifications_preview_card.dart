import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/static.dart';
import '../../../../core/widgets/app_spacing.dart';

class NotificationsPreviewCard extends StatelessWidget {
  const NotificationsPreviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Static.getwidth(context, 375),
      padding: EdgeInsets.all(
        Static.getwidth(context, 18),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
              color: AppColors.black.withValues(alpha: 0.04), blurRadius: 10),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.notifications_active_rounded,
            size: Static.getwidth(context, 42),
            color: Theme.of(context).colorScheme.primary,
          ),
          AppSpacing.height(context, 12),
          Text(
            'الإشعارات',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w700,
              fontSize: Static.getwidth(context, 18),
            ),
          ),
          AppSpacing.height(context, 10),
          Text(
            'ستصلك هنا جميع التحديثات المهمة المتعلقة بحسابك وطلباتك ومنشوراتك.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w400,
              fontSize: Static.getwidth(context, 14),
              color: AppColors.greyColor,
            ),
          ),
          AppSpacing.height(context, 20),
          const _FeatureItem(
            icon: Icons.change_circle_outlined,
            title: 'تغيير حالة الطلبات ومراحل تنفيذها',
          ),
          const _FeatureItem(
            icon: Icons.edit_note_rounded,
            title: 'قبول أو رفض منشورات المدونة',
          ),
          const _FeatureItem(
            icon: Icons.info_outline_rounded,
            title: 'طلب معلومات أو صور إضافية من المخبر',
          ),
          const _FeatureItem(
            icon: Icons.handshake_outlined,
            title: 'قبول أو رفض طلبات الاتصال مع المخابر',
          ),
          const _FeatureItem(
            icon: Icons.star_outline_rounded,
            title: 'إشعار عند إمكانية تقييم الحالة بعد التسليم',
          ),
          const _FeatureItem(
            icon: Icons.campaign_outlined,
            title: 'التحديثات والتنبيهات المهمة داخل التطبيق',
          ),
          AppSpacing.height(context, 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(204, 221, 255, 0.35),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'لن يفوتك أي تحديث مهم، فجميع الأحداث المتعلقة بحالاتك وتواصلك مع المخابر ستظهر هنا مباشرة.',
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
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(
            icon,
            size: 22,
            color: const Color.fromRGBO(54, 122, 255, 1),
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
