import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/lab/features/lab_ad/view/wedjet_lab_ad/lab_ad_image.dart';
import 'package:template/lab/features/lab_ad/view/wedjet_lab_ad_feed/AdImagesGalleryScreen.dart';
import 'package:template/lab/features/lab_blog/model/post_model.dart';

class BlogDoctorPostImage extends StatelessWidget {
  final List<BlogPostAttachment> attachments;

  const BlogDoctorPostImage({
    super.key,
    required this.attachments,
  });

  @override
  Widget build(BuildContext context) {
    if (attachments.isEmpty) {
      return const SizedBox.shrink();
    }

    final imagePaths = attachments
        .map(
          (attachment) => attachment.path,
        )
        .toList();

    return InkWell(
      borderRadius:
          BorderRadius.circular(16),

      onTap: () {
        Get.to(
          () => AdImagesGalleryScreen(
            images: imagePaths,
            initialIndex: 0,
          ),
        );
      },

      child: AppNetworkContentImage(
        imagePath:
            attachments.first.path,
        additionalImagesCount:
            attachments.length - 1,
        borderRadius: 16,
      ),
    );
  }
}