import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/BlogDentists/view/post_details_wedjet/post_details_body.dart';
import 'package:template/Dentist/BlogDentists/view/post_details_wedjet/post_details_header.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/lab/features/lab_blog/model/post_model.dart';

class PostDetailsDialog extends StatelessWidget {
  final BlogPostModel post;

  const PostDetailsDialog({
    super.key,
    required this.post,
  });

  static Future<void> show({
    required BlogPostModel post,
  }) {
    return Get.dialog<void>(
      PostDetailsDialog(post: post),
      barrierDismissible: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 28,
        ),
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 600,
            maxHeight: MediaQuery.sizeOf(context).height * .88,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const PostDoctorDetailsHeader(),
              Flexible(
                child: PostDoctorDetailsBody(
                  post: post,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
