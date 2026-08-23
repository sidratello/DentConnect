import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/BlogDentists/view/doctor_blog_page.dart';
import 'package:template/Dentist/ComplaintPage/view/complaint_page.dart';
import 'package:template/Dentist/LabDetailsPage/view/lab_details_page.dart';
import 'package:template/Dentist/MainPage/controller/navigation_controller.dart';
import 'package:template/core_dentist/theme/app_colors.dart';

import '../../../../core_dentist/utils/static.dart';
import '../../model/app_notification_model.dart';

class NotificationCard extends StatelessWidget {
  final AppNotificationModel notification;

  const NotificationCard({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    final Color color =
        notification.isRead ? AppColors.textSecondary : AppColors.primary;

    void openCases() {
      Get.find<NavigationController>().changePage(3);
      Get.back();
    }

    return GestureDetector(
      onTap: () {
        if (notification.type == 'StatusChanged' &&
            notification.labId != null &&
            notification.orderId != null) {
          openCases();
        }
        if (notification.type == 'OrderAccepted' &&
            notification.labId != null &&
            notification.orderId != null) {
          openCases();
        }
        if (notification.type == 'PriceSet' &&
            notification.labId != null &&
            notification.orderId != null) {
          openCases();
        }
        if (notification.type == 'ConnectionAccepted' &&
            notification.labId != null) {
          Get.to(() => LabDetailsPage(
                id: notification.labId!,
              ));
        }
        if (notification.type == 'ComplaintReply' &&
            notification.labId != null) {
          Get.to(() => ComplaintPage());
        }
        if (notification.type == 'StatusChanged' &&
            notification.blogPostId != null) {
          Get.to(() => const DoctorBlogPage());
        }
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(
          Static.getwidth(context, 16),
        ),
        decoration: BoxDecoration(
          color: notification.isRead
              ? AppColors.border
              : AppColors.primary.withValues(
                  alpha: 0.06,
                ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: notification.isRead
                ? AppColors.border
                : AppColors.primary.withValues(
                    alpha: 0.25,
                  ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: color.withValues(
                  alpha: 0.10,
                ),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(
                _getNotificationIcon(
                  notification.type,
                ),
                color: color,
                size: 21,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.message,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontWeight: notification.isRead
                          ? FontWeight.w400
                          : FontWeight.w600,
                      fontSize: Static.getwidth(
                        context,
                        13,
                      ),
                      height: 1.7,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    _formatNotificationDate(
                      notification.createdAt,
                    ),
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontWeight: FontWeight.w400,
                      fontSize: Static.getwidth(
                        context,
                        10.5,
                      ),
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            if (!notification.isRead) ...[
              const SizedBox(width: 8),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  IconData _getNotificationIcon(
    String type,
  ) {
    switch (type.toLowerCase()) {
      case 'statuschanged':
        return Icons.sync_alt_rounded;

      default:
        return Icons.notifications_none_rounded;
    }
  }

  String _formatNotificationDate(
    DateTime date,
  ) {
    final now = DateTime.now();

    final difference = now.difference(date);

    if (difference.inMinutes < 1) {
      return 'الآن';
    }

    if (difference.inMinutes < 60) {
      return 'منذ ${difference.inMinutes} دقيقة';
    }

    if (difference.inHours < 24) {
      return 'منذ ${difference.inHours} ساعة';
    }

    if (difference.inDays == 1) {
      return 'أمس';
    }

    if (difference.inDays < 7) {
      return 'منذ ${difference.inDays} أيام';
    }

    return '${date.day}/${date.month}/${date.year}';
  }
}
