import 'package:flutter/material.dart';
import 'package:template/Dentist/BlogDentists/view/blog_details_wedjet/blog_post_details_images.dart';
import 'package:template/Dentist/BlogDentists/view/blog_details_wedjet/postDate.dart';
import 'package:template/Dentist/BlogDentists/view/blog_feed_wedjet.dart/blog_post_author.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/lab_blog/model/post_model.dart';

class BlogDoctorPostDetailsContent extends StatelessWidget {
  final BlogPostModel post;

  const BlogDoctorPostDetailsContent({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.littleBlue.withValues(alpha: 0.45),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlogDoctorPostAuthor(
            authorName: post.authorName,
            isDoctor: post.isDoctorPost,
            profilePictureUrl: post.authorProfilePictureUrl,
          ),
          if (post.createdAt != null) ...[
            const SizedBox(height: 14),
            PostDoctorDate(
              date: post.createdAt!,
            ),
          ],
          const SizedBox(height: 18),
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.littleBlue.withValues(alpha: 0.30),
          ),
          const SizedBox(height: 18),
          Text(
            post.title,
            textAlign: TextAlign.right,
            style: AppTextStyles.ibmBold22NeutralStyle.copyWith(
              color: AppColors.darkBlue,
              fontSize: 22,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            post.content,
            textAlign: TextAlign.right,
            style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
              color: AppColors.normalText,
              fontSize: 16,
              height: 1.9,
            ),
          ),
          if (post.attachments.isNotEmpty) ...[
            const SizedBox(height: 24),
            BlogDoctorPostDetailsImages(
              attachments: post.attachments,
            ),
          ],
        ],
      ),
    );
  }
}
