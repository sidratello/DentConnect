import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/BlogDentists/controller/BlogPostsController.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/app_page_header_cases.dart';

class MyBlogDoctorPostsHeader extends GetView<MyBlogDoctorPostsController> {
  const MyBlogDoctorPostsHeader({
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
