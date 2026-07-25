import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class PostDate extends StatelessWidget {
  final DateTime date;

  const PostDate({
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final value = date.toLocal();

    return Row(
      children: [
        const Icon(
          Icons.calendar_today_outlined,
          size: 17,
          color: AppColors.normalText,
        ),

        const SizedBox(width: 8),

        Text(
          _formatDate(value),
          style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
            color: AppColors.normalText,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime value) {
    final day = value.day.toString().padLeft(2, '0');
    final month = value.month.toString().padLeft(2, '0');

    return '$day/$month/${value.year}';
  }
}