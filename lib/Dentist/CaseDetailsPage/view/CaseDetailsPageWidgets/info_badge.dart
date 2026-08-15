import 'package:flutter/material.dart';
import 'package:template/core/utils/static.dart';

class InfoBadge extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const InfoBadge({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Static.getwidth(context, 12),
        vertical: Static.getheight(context, 8),
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: Static.getwidth(context, 16),
          ),
          SizedBox(
            width: Static.getwidth(context, 6),
          ),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w600,
              fontSize: Static.getwidth(context, 12),
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
