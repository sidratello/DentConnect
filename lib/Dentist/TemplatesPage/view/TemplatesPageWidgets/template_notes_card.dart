import 'package:flutter/material.dart';
import 'package:template/core/widgets/app_spacing.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/static.dart';

class TemplateNotesCard extends StatelessWidget {
  const TemplateNotesCard({
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
            'ملاحظات',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w600,
              fontSize: Static.getwidth(context, 18),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          AppSpacing.height(context, 12),
          Text(
            'يفضل التأكد من توافق اللون مع الأسنان المجاورة قبل التطبيق النهائي ومراجعة الحالة السريرية للمريض قبل البدء.',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w400,
              fontSize: Static.getwidth(context, 14),
              height: 21 / 14,
            ),
          ),
        ],
      ),
    );
  }
}
