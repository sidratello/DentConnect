import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/BlogDentists/view/blog_details_wedjet/blog_details_body.dart';
import 'package:template/core/app_colors.dart';

class BlogDoctorPostDetailsScreen extends StatelessWidget {
  const BlogDoctorPostDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlogDoctorPostDetailsBody(
          post: arguments,
        ),
      ),
    );
  }
}
