import 'package:flutter/material.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/utils/static.dart';

class ComplaintLabLoading extends StatelessWidget {
  const ComplaintLabLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Static.getheight(context, 58),
      padding: EdgeInsets.symmetric(horizontal: Static.getwidth(context, 16)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xffE7EAF0)),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.primary,
            ),
          ),
          SizedBox(width: Static.getwidth(context, 12)),
          Text(
            'جاري تحميل المخابر...',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontSize: Static.getwidth(context, 12),
              color: const Color(0xff858D9D),
            ),
          ),
        ],
      ),
    );
  }
}
