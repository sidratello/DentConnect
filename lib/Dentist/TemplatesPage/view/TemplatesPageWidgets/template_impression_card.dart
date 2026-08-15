import 'package:flutter/material.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/static.dart';
import 'package:template/core/widgets/app_spacing.dart';

class TemplateImpressionCard extends StatelessWidget {
  final String impression;

  const TemplateImpressionCard({
    super.key,
    required this.impression,
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
            'نوع الطبعة',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w600,
              fontSize: Static.getwidth(context, 18),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          AppSpacing.height(context, 12),
          Text(impression),
        ],
      ),
    );
  }
}
