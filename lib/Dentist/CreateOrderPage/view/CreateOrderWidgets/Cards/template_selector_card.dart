import 'package:flutter/material.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/static.dart';

class TemplateSelectorCard extends StatelessWidget {
  final String templateName;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;

  const TemplateSelectorCard({
    super.key,
    required this.templateName,
    required this.description,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: EdgeInsets.only(
          bottom: Static.getheight(context, 12),
        ),
        padding: EdgeInsets.all(
          Static.getwidth(context, 16),
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryLightBackground
              : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primaryLightBackground,
              child: Icon(
                Icons.description_outlined,
                color: AppColors.primary,
              ),
            ),
            SizedBox(width: Static.getwidth(context, 14)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    templateName,
                    style: TextStyle(
                      fontFamily: "IBM Plex Sans Arabic",
                      fontWeight: FontWeight.bold,
                      fontSize: Static.getwidth(context, 14),
                    ),
                  ),
                  SizedBox(height: Static.getheight(context, 4)),
                  Text(
                    description,
                    style: TextStyle(
                      fontFamily: "IBM Plex Sans Arabic",
                      color: AppColors.greyColor,
                      fontSize: Static.getwidth(context, 12),
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: AppColors.primary,
              ),
          ],
        ),
      ),
    );
  }
}
