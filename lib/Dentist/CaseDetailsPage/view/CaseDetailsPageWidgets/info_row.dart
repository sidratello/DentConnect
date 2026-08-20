import 'package:flutter/material.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/utils/static.dart';

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const InfoRow({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Static.getheight(context, 10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Static.getwidth(context, 38),
            height: Static.getwidth(context, 38),
            decoration: BoxDecoration(
              color:
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: Static.getwidth(context, 19),
            ),
          ),
          SizedBox(width: Static.getwidth(context, 12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w500,
                    fontSize: Static.getwidth(context, 13),
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: Static.getheight(context, 3)),
                Text(
                  value,
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w700,
                    fontSize: Static.getwidth(context, 15),
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
