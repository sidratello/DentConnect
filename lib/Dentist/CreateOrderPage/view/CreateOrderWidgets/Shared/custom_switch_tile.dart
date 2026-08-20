import 'package:flutter/material.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/utils/static.dart';

class CustomSwitchTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitchTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.icon,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: EdgeInsets.symmetric(
        horizontal: Static.getwidth(context, 16),
        vertical: Static.getheight(context, 14),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: value ? AppColors.primary : AppColors.border,
          width: value ? 1.5 : 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: Static.getwidth(context, 42),
            height: Static.getwidth(context, 42),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: AppColors.primary,
              size: 22,
            ),
          ),
          SizedBox(width: Static.getwidth(context, 14)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: "IBM Plex Sans Arabic",
                    fontWeight: FontWeight.w600,
                    fontSize: Static.getwidth(context, 14),
                  ),
                ),
                if (subtitle != null) ...[
                  SizedBox(
                    height: Static.getheight(context, 4),
                  ),
                  Text(
                    subtitle!,
                    style: TextStyle(
                      fontFamily: "IBM Plex Sans Arabic",
                      color: Colors.grey.shade600,
                      fontSize: Static.getwidth(context, 12),
                    ),
                  ),
                ],
              ],
            ),
          ),
          Switch(
            value: value,
            activeColor: AppColors.primary,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
