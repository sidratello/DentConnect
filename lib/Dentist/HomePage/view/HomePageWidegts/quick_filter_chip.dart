import 'package:flutter/material.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/utils/static.dart';

class QuickFilterChip extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const QuickFilterChip({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeInOut,
      margin: EdgeInsets.only(
        left: Static.getwidth(context, 10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(30),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            padding: EdgeInsets.symmetric(
              horizontal: Static.getwidth(context, 16),
              vertical: Static.getheight(context, 10),
            ),
            decoration: BoxDecoration(
              color: isSelected ? primary : Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: isSelected ? primary : AppColors.border,
              ),
              boxShadow: [
                BoxShadow(
                  color: isSelected
                      ? primary.withValues(alpha: 0.20)
                      : Colors.black.withValues(alpha: 0.03),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: Static.getwidth(context, 18),
                  color: isSelected ? Colors.white : primary,
                ),
                SizedBox(
                  width: Static.getwidth(context, 8),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w600,
                    fontSize: Static.getwidth(context, 13),
                    color: isSelected
                        ? Colors.white
                        : Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
