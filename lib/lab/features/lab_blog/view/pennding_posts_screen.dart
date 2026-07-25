import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/lab/features/lab_blog/controller/BlogPostsController.dart';
import 'package:template/lab/features/lab_blog/view/pennding_post_wedjet/pending_posts_body.dart';
import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart'
    show LabBackgroundLayout;

class MyBlogPostsScreen extends StatelessWidget {
  const MyBlogPostsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.find<MyBlogPostsController>();

    return const LabBackgroundLayout(
      child: MyBlogPostsBody(),
    );
  }
}