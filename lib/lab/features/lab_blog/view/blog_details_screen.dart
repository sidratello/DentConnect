import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_colors.dart';

import 'package:template/lab/features/lab_blog/view/blog_details_wedjet/blog_details_body.dart';


class BlogPostDetailsScreen
    extends StatelessWidget {
  const BlogPostDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;


    return Scaffold(
        backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlogPostDetailsBody(
          post: arguments,
        ),
      ),
    );
  }
}