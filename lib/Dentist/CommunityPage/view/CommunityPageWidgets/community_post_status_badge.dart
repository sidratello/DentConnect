import 'package:flutter/material.dart';
import 'package:template/core_dentist/theme/app_colors.dart';

import '../../../../core_dentist/utils/static.dart';
import '../../model/community_post_model.dart';

class CommunityPostStatusBadge extends StatelessWidget {
  final PostStatus status;

  const CommunityPostStatusBadge({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    String text;
    Color backgroundColor;
    Color textColor;

    switch (status) {
      case PostStatus.pending:
        text = 'قيد المراجعة';

        backgroundColor = AppColors.pendingPostBackground;

        textColor = AppColors.pendingPost;
        break;

      case PostStatus.approved:
        text = 'تم النشر';

        backgroundColor = AppColors.approvedPostBackground;

        textColor = AppColors.success;
        break;

      case PostStatus.rejected:
        text = 'مرفوض';

        backgroundColor = AppColors.rejectedPostBackground;

        textColor = AppColors.lightRed;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Static.getwidth(
          context,
          12,
        ),
        vertical: Static.getheight(
          context,
          5,
        ),
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          100,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'IBM Plex Sans Arabic',
          fontWeight: FontWeight.w500,
          fontSize: Static.getwidth(
            context,
            12,
          ),
          color: textColor,
        ),
      ),
    );
  }
}
