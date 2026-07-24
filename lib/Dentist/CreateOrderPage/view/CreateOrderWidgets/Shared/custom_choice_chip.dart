import 'package:flutter/material.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/static.dart';

class CustomChoiceChip extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomChoiceChip({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: EdgeInsets.symmetric(
            vertical: Static.getheight(context, 18),
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
            boxShadow: [
              BoxShadow(
                color: isSelected
                    ? AppColors.boxShadow
                    : Colors.black.withOpacity(.03),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: Static.getwidth(context, 30),
                color: isSelected ? AppColors.primary : AppColors.greyColor,
              ),
              SizedBox(height: Static.getheight(context, 10)),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "IBM Plex Sans Arabic",
                  fontWeight: FontWeight.w600,
                  fontSize: Static.getwidth(context, 14),
                  color: isSelected ? AppColors.primary : AppColors.textPrimary,
                ),
              ),
              SizedBox(height: Static.getheight(context, 8)),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isSelected ? 1 : 0,
                child: const Icon(
                  Icons.check_circle,
                  color: AppColors.primary,
                  size: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
