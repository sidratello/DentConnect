import 'package:flutter/material.dart';

import 'package:template/core/app_text_styles.dart';

class BlogPostStatusBadge
    extends StatelessWidget {
  final String status;

  const BlogPostStatusBadge({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final config = _statusConfig(status);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: config.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        config.text,
        style: AppTextStyles
            .ibmRegular12DarkStyle
            .copyWith(
          color: config.textColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  _StatusConfig _statusConfig(
    String status,
  ) {
    switch (status.toLowerCase()) {
      case 'approved':
        return const _StatusConfig(
          text: 'تمت الموافقة',
          backgroundColor: Color(0xFFE8F7EF),
          textColor: Color(0xFF168653),
        );

      case 'rejected':
        return const _StatusConfig(
          text: 'مرفوض',
          backgroundColor: Color(0xFFFFECEC),
          textColor: Color(0xFFC74242),
        );

      case 'pending':
      default:
        return const _StatusConfig(
          text: 'بانتظار الموافقة',
          backgroundColor: Color(0xFFFFF3D9),
          textColor: Color(0xFFD59700),
        );
    }
  }
}

class _StatusConfig {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const _StatusConfig({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  });
}