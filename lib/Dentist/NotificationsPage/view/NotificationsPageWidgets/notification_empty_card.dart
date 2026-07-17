import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/static.dart';
import '../../../../core/widgets/app_spacing.dart';

class NotificationEmptyCard extends StatelessWidget {
  const NotificationEmptyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Static.getwidth(context, 40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Static.getwidth(context, 90),
              height: Static.getwidth(context, 90),
              decoration: BoxDecoration(
                color: Theme.of(context).shadowColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.notifications_none_rounded,
                size: Static.getwidth(context, 42),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            AppSpacing.height(context, 20),
            Text(
              'لا يوجد إشعارات حالياً',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w600,
                fontSize: Static.getwidth(context, 18),
                color: AppColors.textSecondary,
              ),
            ),
            AppSpacing.height(context, 8),
            Text(
              'ستظهر هنا جميع التحديثات والإشعارات الخاصة بطلباتك',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w400,
                fontSize: Static.getwidth(context, 14),
                height: 21 / 14,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
