import 'package:flutter/material.dart';
import 'package:template/core_dentist/theme/app_colors.dart';

import '../../../../core_dentist/utils/static.dart';

class CaseSectionHeader extends StatelessWidget {
  final String title;

  final int count;

  final bool expanded;

  final VoidCallback onTap;

  const CaseSectionHeader({
    super.key,
    required this.title,
    required this.count,
    required this.expanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Static.getwidth(
            context,
            24,
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(
            14,
          ),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(
              14,
            ),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(
                14,
              ),
            ),
            child: Row(
              children: [
                AnimatedRotation(
                  turns: expanded ? 0.5 : 0,
                  duration: const Duration(
                    milliseconds: 250,
                  ),
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.littleBlue,
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                  child: Text(
                    count.toString(),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w600,
                    fontSize: Static.getwidth(
                      context,
                      16,
                    ),
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
