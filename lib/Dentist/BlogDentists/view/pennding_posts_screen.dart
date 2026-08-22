import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/BlogDentists/controller/BlogPostsController.dart';
import 'package:template/Dentist/BlogDentists/view/pennding_post_wedjet/pending_posts_body.dart';

import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart'
    show LabBackgroundLayout;

class MyBlogDoctorPostsScreen extends StatelessWidget {
  const MyBlogDoctorPostsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.find<MyBlogDoctorPostsController>();

    return const LabBackgroundLayout(
      child: MyBlogDoctorPostsBody(),
    );
  }
}
