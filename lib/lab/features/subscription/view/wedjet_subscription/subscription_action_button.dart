import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/app_button.dart';

class SubscriptionActionButton
    extends StatelessWidget {
  final bool isFreeTrial;
  final VoidCallback onTap;

  const SubscriptionActionButton({
    super.key,
    required this.isFreeTrial,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      title:
          isFreeTrial
              ? 'دفع الاشتراك'
              : 'تجديد الاشتراك',
      type:
          AppButtonType.gradient,
      height: 54,
      borderRadius: 12,
      onTap:
          onTap,
      icon: const Icon(
        Icons.payments_outlined,
        color:
            AppColors.white,
        size: 21,
      ),
    );
  }
}