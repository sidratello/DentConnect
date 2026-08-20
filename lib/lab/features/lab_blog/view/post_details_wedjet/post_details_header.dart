import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class PostDetailsHeader extends StatelessWidget {
  const PostDetailsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        18,
        14,
        12,
        10,
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withOpacity(.08),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.article_outlined,
              color: AppColors.primaryBlue,
              size: 23,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'تفاصيل المنشور',
              style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
                color: AppColors.darkBlue,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          IconButton(
            onPressed: Get.back,
            icon: const Icon(
              Icons.close_rounded,
              color: AppColors.normalText,
            ),
          ),
        ],
      ),
    );
  }
}