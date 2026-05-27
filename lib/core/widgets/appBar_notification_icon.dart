import 'package:flutter/material.dart';
import 'package:template/core/utils/static.dart';

class AppbarNotificationIcon extends StatelessWidget {
  const AppbarNotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
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
