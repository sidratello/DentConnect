import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/app_button.dart';

class SubscriptionContinueButton
    extends StatelessWidget {
  final bool enabled;
  final VoidCallback onTap;
 final bool isLoading;
  const SubscriptionContinueButton({
    super.key,
    required this.enabled,
    required this.onTap,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      title:
          'متابعة الدفع',
      type:
          AppButtonType.gradient,
      height: 54,
      borderRadius: 12,
         isLoading:
          isLoading,
      enabled:
          enabled,
      onTap:
          onTap,
      icon: const Icon(
        Icons
            .payments_outlined,
        color:
            AppColors.white,
        size: 21,
      ),
    );
  }
}