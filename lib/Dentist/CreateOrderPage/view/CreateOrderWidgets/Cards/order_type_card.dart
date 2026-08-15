import 'package:flutter/material.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/static.dart';

class OrderTypeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const OrderTypeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.all(
          Static.getwidth(context, 18),
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryLightBackground
              : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: Static.getwidth(context, 52),
              height: Static.getheight(context, 52),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary
                    : AppColors.primaryLightBackground,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : AppColors.primary,
              ),
            ),
            SizedBox(width: Static.getwidth(context, 16)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: "IBM Plex Sans Arabic",
                      fontWeight: FontWeight.w700,
                      fontSize: Static.getwidth(context, 15),
                    ),
                  ),
                  SizedBox(height: Static.getheight(context, 4)),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontFamily: "IBM Plex Sans Arabic",
                      color: AppColors.greyColor,
                      fontSize: Static.getwidth(context, 12),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedOpacity(
              opacity: isSelected ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: const Icon(
                Icons.check_circle,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
