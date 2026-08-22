import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:template/Dentist/BlogDentists/view/pennding_post_wedjet/author_profile_picture.dart';
import 'package:template/Dentist/BlogDentists/view/pennding_post_wedjet/pennding_post_image.dart';
import 'package:template/Dentist/BlogDentists/view/pennding_post_wedjet/pennding_post_status_badge.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/lab_blog/model/post_model.dart';

class BlogDoctorPostCard extends StatelessWidget {
  final BlogPostModel post;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  const BlogDoctorPostCard({
    super.key,
    required this.post,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final imagePath =
        post.attachments.isEmpty ? null : post.attachments.first.path;

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: AppColors.littleBlue.withOpacity(.35),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.04),
                blurRadius: 14,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                textDirection: ui.TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AuthorDoctorProfilePicture(
                    imageUrl: post.authorProfilePictureUrl,
                    isLab: post.isLabPost,
                    size: 52,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.authorName.trim().isEmpty
                              ? 'مخبر أسنان'
                              : post.authorName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.right,
                          style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
                            color: AppColors.darkBlue,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.more_vert_rounded,
                      color: AppColors.normalText,
                    ),
                    onSelected: (value) {
                      switch (value) {
                        case 'edit':
                          onEdit?.call();
                          break;

                        case 'delete':
                          onDelete?.call();
                          break;
                      }
                    },
                    itemBuilder: (context) => const [
                      PopupMenuItem<String>(
                        value: 'edit',
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit_outlined,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text('تعديل المنشور'),
                          ],
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'delete',
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete_outline_rounded,
                              size: 20,
                              color: Colors.red,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'حذف المنشور',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlogDoctorPostImage(
                    path: imagePath,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
                            color: AppColors.darkBlue,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          post.content,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style:
                              AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                            color: AppColors.normalText,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  BlogDoctorPostStatusBadge(
                    status: post.status,
                  ),
                  const Spacer(),
                  Text(
                    _formatDate(post.createdAt),
                    style: AppTextStyles.ibmRegular12DarkStyle.copyWith(
                      color: AppColors.normalText,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) {
      return '';
    }

    return DateFormat(
      'yyyy/MM/dd',
    ).format(date.toLocal());
  }
}
