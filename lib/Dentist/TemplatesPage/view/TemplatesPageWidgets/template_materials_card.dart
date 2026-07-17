import 'package:flutter/material.dart';
import 'package:template/core/widgets/app_spacing.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/static.dart';

class TemplateMaterialsCard extends StatelessWidget {
  const TemplateMaterialsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        Static.getwidth(context, 18),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'المواد المستخدمة',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w600,
              fontSize: Static.getwidth(context, 18),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          AppSpacing.height(context, 12),
          const Text(
            '• Composite',
          ),
          const Text(
            '• Nano Hybrid',
          ),
          const Text(
            '• Adhesive Bond',
          ),
        ],
      ),
    );
  }
}
