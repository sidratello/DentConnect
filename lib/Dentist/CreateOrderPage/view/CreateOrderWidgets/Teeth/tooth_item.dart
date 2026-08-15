import 'package:flutter/material.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/static.dart';

class ToothItem extends StatelessWidget {
  final String toothNumber;
  final bool isSelected;
  final VoidCallback onTap;

  const ToothItem({
    super.key,
    required this.toothNumber,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: Static.getwidth(context, 36),
        height: Static.getwidth(context, 36),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          toothNumber,
          style: TextStyle(
            fontFamily: "IBM Plex Sans Arabic",
            fontWeight: FontWeight.w600,
            fontSize: Static.getwidth(context, 14),
            color: isSelected ? Colors.white : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
