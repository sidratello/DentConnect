import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/lab/features/lab_blog/model/post_model.dart';
import 'package:template/lab/features/lab_blog/view/blog_feed_wedjet.dart/blog_post_author.dart';
import 'package:template/lab/features/lab_blog/view/blog_feed_wedjet.dart/blog_post_footer.dart';
import 'package:template/lab/features/lab_blog/view/blog_feed_wedjet.dart/blog_post_image.dart';



class BlogPostAceptedCard
    extends StatelessWidget {
  final BlogPostModel post;
  final VoidCallback onTap;

  const BlogPostAceptedCard({
    super.key,
    required this.post,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius:
          BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius:
            BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius:
                BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.littleBlue
                  .withOpacity(.45),
            ),
            boxShadow: [
              BoxShadow(
                color:
                    Colors.black.withOpacity(.06),
                blurRadius: 16,
                offset:
                    const Offset(0, 7),
              ),
            ],
          ),
          child: Directionality(
            textDirection:
                TextDirection.rtl,
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
     BlogPostAuthor(
  authorName: post.authorName,
  isDoctor: post.isDoctorPost,
  profilePictureUrl:
      post.authorProfilePictureUrl,
),
                const SizedBox(height: 15),
                Text(
                  post.title,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: AppColors.darkBlue,
                    fontSize: 17,
                    fontWeight:
                        FontWeight.w700,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  post.content,
                  maxLines:
                      post.hasAttachments ? 3 : 5,
                  overflow:
                      TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color:
                        AppColors.normalText,
                    fontSize: 14,
                    height: 1.7,
                  ),
                ),
                if (post.firstAttachment !=
                    null) ...[
                  const SizedBox(height: 14),
            BlogPostImage(
  attachments:
      post.attachments,
),
                ],
                const SizedBox(height: 14),
                Divider(
                  height: 1,
                  color:
                      AppColors.littleBlue
                          .withOpacity(.30),
                ),
                const SizedBox(height: 11),
                BlogPostFooter(
                  createdAt:
                      post.createdAt,
                  imagesCount:
                      post.attachments.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}