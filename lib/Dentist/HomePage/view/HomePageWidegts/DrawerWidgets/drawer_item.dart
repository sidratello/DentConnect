import 'package:flutter/material.dart';
import 'package:template/core/utils/static.dart';

import '../../../../../core/theme/app_colors.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Static.getwidth(context, 14),
          vertical: Static.getheight(context, 14),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              width: Static.getwidth(context, 12),
            ),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w500,
                fontSize: Static.getwidth(context, 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
