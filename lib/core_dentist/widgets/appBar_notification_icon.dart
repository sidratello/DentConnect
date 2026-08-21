import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_router.dart';
import 'package:template/core_dentist/utils/static.dart';

class AppbarNotificationIcon extends StatelessWidget {
  const AppbarNotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.toNamed(AppRouter.notificationPage);
      },
      icon: Image.asset(
        'assets/images/notification.png',
        width: Static.getwidth(context, 24),
        height: Static.getwidth(context, 27.71),
        fit: BoxFit.contain,
      ),
      padding: EdgeInsets.zero,
      // constraints: const BoxConstraints(),
    );
  }
}
