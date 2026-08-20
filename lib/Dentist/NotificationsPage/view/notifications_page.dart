import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/NotificationsPage/model/app_notification_model.dart';
import 'package:template/Dentist/NotificationsPage/view/NotificationsPageWidgets/notification_card.dart';
import 'package:template/Dentist/NotificationsPage/view/NotificationsPageWidgets/notification_empty_card.dart';
import 'package:template/Dentist/NotificationsPage/view/NotificationsPageWidgets/notifications_preview_card.dart';
import 'package:template/core_dentist/utils/static.dart';
import 'package:template/core_dentist/widgets/app_spacing.dart';
import 'package:template/core_dentist/widgets/appbar_vector_black.dart';
import 'package:template/core_dentist/widgets/top_background.dart';

import '../../../core_dentist/theme/app_colors.dart';
import '../../HomePage/controller/home_controller.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      const AppNotificationModel(
        title: 'تم قبول طلبك من المخبر',
        time: 'منذ 5 دقائق',
      ),
      const AppNotificationModel(
        title: 'طلب المخبر مواد أو صور إضافية',
        time: 'منذ 20 دقيقة',
      ),
      const AppNotificationModel(
        title: 'تم إلغاء الطلب',
        time: 'منذ ساعة',
      ),
      const AppNotificationModel(
        title: 'اكتمل التسليم',
        time: 'أمس',
      ),
    ];

    final appModeController = Get.find<HomeController>();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: AppColors.surfaceTintColor,
          surfaceTintColor: AppColors.surfaceTintColor,
          elevation: 0,
          title: Text(
            ' الإشعارات',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w700,
              fontSize: Static.getwidth(context, 22),
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: const [AppbarVectorBlack()],
        ),
        body: TopBackground(
          body: SafeArea(child: Obx(() {
            if (appModeController.isPreviewMode.value) {
              return const Center(
                child: NotificationsPreviewCard(),
              );
            }
            if (notifications.isEmpty) {
              return const NotificationEmptyCard();
            }
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Static.getwidth(context, 24),
                vertical: Static.getheight(context, 8),
              ),
              child: ListView.separated(
                itemCount: notifications.length,
                separatorBuilder: (_, __) => AppSpacing.height(context, 18),
                itemBuilder: (context, index) {
                  final colors = [
                    AppColors.success,
                    AppColors.warning,
                    AppColors.error,
                    AppColors.primaryBlue,
                  ];

                  return NotificationCard(
                    notification: notifications[index],
                    borderColor: colors[index % colors.length],
                    icon: Icons.done_all_rounded,
                  );
                },
              ),
            );
          })),
        ),
      ),
    );
  }
}
