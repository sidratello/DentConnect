import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/app_page_header_cases.dart';
import 'package:template/lab/features/lab_blog/controller/BlogPostsController.dart';

class MyBlogPostsHeader
    extends GetView<MyBlogPostsController> {
  const MyBlogPostsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppPageHeader(
      title: 'منشوراتي',
      subtitle: 'تابع حالة منشوراتك ومراجعة الأدمن',
      icon: Icons.article_outlined,
      action: Positioned(
        right: 16,
        top: 16,
        child: IconButton(
          onPressed: controller.openCreateBlog,
          icon: const Icon(
            Icons.add_circle_outline_rounded,
            color: AppColors.primaryBlue,
            size: 30,
          ),
        ),
      ),
    );
  }
}