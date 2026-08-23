import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          body: SafeArea(
            child: Obx(
              () {
                if (appModeController.isPreviewMode.value) {
                  return const Center(
                    child: NotificationsPreviewCard(),
                  );
                }
                if (appModeController.isLoadingNotifications.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  );
                }
                final notifications = appModeController.notifications;
                if (notifications.isEmpty) {
                  return const NotificationEmptyCard();
                }
                return RefreshIndicator(
                  color: AppColors.primary,
                  onRefresh: appModeController.fetchNotifications,
                  child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: Static.getwidth(context, 24),
                      vertical: Static.getheight(context, 8),
                    ),
                    itemCount: notifications.length,
                    separatorBuilder: (_, __) => AppSpacing.height(context, 18),
                    itemBuilder: (context, index) {
                      final notification = notifications[index];
                      return NotificationCard(
                        notification: notification,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
