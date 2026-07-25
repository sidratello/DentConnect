import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/lab/features/lab_blog/view/blog_feed_wedjet.dart/blog_add_post_button.dart';
import 'package:template/lab/features/lab_blog/view/blog_feed_wedjet.dart/blog_feed_body.dart';

import '../controller/blog_feed_controller.dart';

class BlogFeedScreen
    extends GetView<BlogFeedController> {
  const BlogFeedScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: AppColors.background,
      body: SafeArea(        
        child: BlogFeedBody(),
),


     floatingActionButton: BlogAddPostButton(
        onPressed: controller.openAddPost,
      ),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.endFloat,
    );
    
  }
}