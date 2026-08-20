import 'package:flutter/material.dart';
import 'package:template/core_dentist/widgets/app_spacing.dart';

import '../../../../core_dentist/theme/app_colors.dart';
import '../../../../core_dentist/utils/static.dart';

class PendingPostBanner extends StatelessWidget {
  const PendingPostBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Static.getwidth(context, 16),
        vertical: Static.getheight(context, 14),
      ),
      decoration: BoxDecoration(
        color: AppColors.darkBlue,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(
            Icons.schedule_rounded,
            color: Theme.of(context).colorScheme.primary,
          ),
          AppSpacing.width(context, 10),
          Expanded(
            child: Text(
              'لديك منشور بانتظار مراجعة الإدارة',
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w500,
                fontSize: Static.getwidth(context, 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
