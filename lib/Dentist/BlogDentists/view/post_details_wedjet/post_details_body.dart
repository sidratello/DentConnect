import 'package:flutter/material.dart';
import 'package:template/Dentist/BlogDentists/view/post_details_wedjet/post_details_attachments.dart';
import 'package:template/Dentist/BlogDentists/view/post_details_wedjet/post_details_status_card.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/lab_blog/model/post_model.dart';

class PostDoctorDetailsBody extends StatelessWidget {
  final BlogPostModel post;

  const PostDoctorDetailsBody({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
        18,
        4,
        18,
        24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostDoctorStatusCard(
            status: post.status,
            reviewMessage: post.reviewMessage,
          ),
          const SizedBox(height: 18),
          Text(
            post.title,
            style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
              color: AppColors.darkBlue,
              fontWeight: FontWeight.w800,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            post.content,
            textAlign: TextAlign.right,
            style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
              color: AppColors.normalText,
              fontSize: 14,
              height: 1.8,
            ),
          ),
          if (post.attachments.isNotEmpty) ...[
            const SizedBox(height: 20),
            PostDoctorAttachments(
              attachments: post.attachments,
            ),
          ],
        ],
      ),
    );
  }
}
