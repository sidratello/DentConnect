import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/BlogDentists/controller/blog_feed_controller.dart';
import 'package:template/Dentist/BlogDentists/view/blog_feed_wedjet.dart/blog_add_post_button.dart';
import 'package:template/Dentist/BlogDentists/view/blog_feed_wedjet.dart/blog_feed_body.dart';
import 'package:template/core/app_colors.dart';

class BlogDoctorFeedScreen extends GetView<BlogFeedDoctorController> {
  const BlogDoctorFeedScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: const SafeArea(
        child: BlogDoctorFeedBody(),
      ),
      floatingActionButton: BlogDoctorAddPostButton(
        onPressed: controller.openAddPost,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
