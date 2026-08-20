import 'package:flutter/material.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/utils/static.dart';
import 'package:template/core_dentist/widgets/app_spacing.dart';

class TemplateOptionsCard extends StatelessWidget {
  final bool urgent;
  final bool tryIn;

  const TemplateOptionsCard({
    super.key,
    required this.urgent,
    required this.tryIn,
  });

  Widget _buildItem(
    String title,
    bool value,
    BuildContext context,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Static.getwidth(context, 14),
        vertical: Static.getheight(context, 10),
      ),
      decoration: BoxDecoration(
        color: value ? AppColors.boxGreen : AppColors.boxRed,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(
            value ? Icons.check_circle : Icons.cancel,
            color: value ? AppColors.success : AppColors.error,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

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
            'خيارات القالب',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w600,
              fontSize: Static.getwidth(context, 18),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          AppSpacing.height(context, 16),
          _buildItem(
            'حالة مستعجلة',
            urgent,
            context,
          ),
          AppSpacing.height(context, 10),
          _buildItem(
            'تحتاج تجربة',
            tryIn,
            context,
          ),
        ],
      ),
    );
  }
}
