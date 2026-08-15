import 'package:flutter/material.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/widgets/app_spacing.dart';

import '../../../../core/utils/static.dart';
import '../../model/app_notification_model.dart';

class NotificationCard extends StatelessWidget {
  final AppNotificationModel notification;
  final Color borderColor;
  final IconData icon;

  const NotificationCard({
    super.key,
    required this.notification,
    required this.borderColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Static.getwidth(context, 24),
        vertical: Static.getheight(context, 10),
      ),
      decoration: BoxDecoration(
        color: AppColors.border,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 2),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/Vector.png',
          ),
          fit: BoxFit.cover,
          alignment: Alignment.centerLeft,
          opacity: 0.25,
        ),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: borderColor,
                size: Static.getwidth(context, 22),
              ),
              AppSpacing.width(context, 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontWeight: FontWeight.w600,
                      fontSize: Static.getwidth(context, 14),
                      height: 21 / 14,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  AppSpacing.height(context, 2),
                  Text(
                    notification.time,
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontWeight: FontWeight.w400,
                      fontSize: Static.getwidth(context, 11),
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
