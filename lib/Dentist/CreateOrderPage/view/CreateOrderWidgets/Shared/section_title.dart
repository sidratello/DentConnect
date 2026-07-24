import 'package:flutter/material.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/static.dart';

class SectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;

  const SectionTitle({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Static.getheight(context, 8),
      ),
      child: Row(
        children: [
          Container(
            width: Static.getwidth(context, 38),
            height: Static.getheight(context, 38),
            decoration: BoxDecoration(
              color: AppColors.primaryLightBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: AppColors.primary,
              size: Static.getwidth(context, 20),
            ),
          ),
          SizedBox(width: Static.getwidth(context, 12)),
          Expanded(
            child: Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontFamily: "IBM Plex Sans Arabic",
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
