import 'package:flutter/material.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/utils/static.dart';

class ComplaintHeader extends StatelessWidget {
  const ComplaintHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(Static.getwidth(context, 20)),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.primary.withValues(alpha: 0.75),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.15),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: Static.getwidth(context, 52),
            height: Static.getwidth(context, 52),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.support_agent_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),
          SizedBox(width: Static.getwidth(context, 14)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'نحن هنا لمساعدتك',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontSize: Static.getwidth(context, 17),
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: Static.getheight(context, 5)),
                Text(
                  'شاركنا مشكلتك وسنعمل على حلها بأسرع وقت ممكن',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontSize: Static.getwidth(context, 12),
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withValues(alpha: 0.9),
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
