import 'package:flutter/material.dart';

import '../../../../../../core/app_colors.dart';
import '../../../../../../core/widgets/app_button.dart';

class ScanSlotsAddAction extends StatelessWidget {
  final VoidCallback onTap;

  const ScanSlotsAddAction({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        20,
        8,
        20,
        18,
      ),
      child: AppButton(
        title: 'إضافة موعد جديد',
        type: AppButtonType.gradient,
        height: 58,
        borderRadius: 16,
        icon: const Icon(
          Icons.add_circle,
          color: AppColors.white,
          size: 25,
        ),
        onTap: onTap,
      ),
    );
  }
}