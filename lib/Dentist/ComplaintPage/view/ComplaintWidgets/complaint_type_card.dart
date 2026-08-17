import 'package:flutter/material.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/static.dart';

class ComplaintTypeCard extends StatelessWidget {
  const ComplaintTypeCard({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final bool isSelected;
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(Static.getwidth(context, 16)),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withValues(alpha: 0.08)
              : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected ? AppColors.primary : const Color(0xffE7EAF0),
            width: isSelected ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Static.getwidth(context, 44),
              height: Static.getwidth(context, 44),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : const Color(0xffF1F4F8),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : const Color(0xff687386),
                size: 23,
              ),
            ),
            SizedBox(height: Static.getheight(context, 12)),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontSize: Static.getwidth(context, 13),
                fontWeight: FontWeight.w700,
                color: isSelected ? AppColors.primary : const Color(0xff20242B),
              ),
            ),
            SizedBox(height: Static.getheight(context, 4)),
            Text(
              subtitle,
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontSize: Static.getwidth(context, 10),
                fontWeight: FontWeight.w400,
                color: const Color(0xff858D9D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
