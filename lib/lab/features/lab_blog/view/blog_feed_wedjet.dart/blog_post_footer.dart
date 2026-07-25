import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:template/core/app_colors.dart';

class BlogPostFooter
    extends StatelessWidget {
  final DateTime? createdAt;
  final int imagesCount;

  const BlogPostFooter({
    super.key,
    required this.createdAt,
    required this.imagesCount,
  });

  String get formattedDate {
    if (createdAt == null) {
      return '';
    }

    return DateFormat(
      'yyyy/MM/dd',
    ).format(createdAt!.toLocal());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.calendar_today_outlined,
          size: 16,
          color: AppColors.normalText,
        ),
        const SizedBox(width: 6),
        Text(
          formattedDate,
          style: const TextStyle(
            color: AppColors.normalText,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        if (imagesCount > 0) ...[
          const Icon(
            Icons.photo_library_outlined,
            size: 18,
            color: AppColors.primaryBlue,
          ),
          const SizedBox(width: 5),
          Text(
            imagesCount.toString(),
            style: const TextStyle(
              color: AppColors.darkBlue,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 14),
        ],
        Directionality(
          textDirection: ui.TextDirection.ltr,
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 15,
            color: AppColors.primaryBlue,
          ),
        ),
      ],
    );
  }
}