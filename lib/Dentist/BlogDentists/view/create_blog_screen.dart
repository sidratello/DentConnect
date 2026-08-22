import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/BlogDentists/controller/create_blog_controller.dart';
import 'package:template/Dentist/BlogDentists/view/creat_post_wedjet/create_blog_actions.dart';
import 'package:template/Dentist/BlogDentists/view/creat_post_wedjet/create_blog_body.dart';

import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart'
    show LabBackgroundLayout;

class CreateDoctorBlogScreen extends StatelessWidget {
  const CreateDoctorBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CreateDoctorBlogController>();

    return const LabBackgroundLayout(
      child: Column(
        children: [
          Expanded(
            child: CreatedoctorBlogBody(),
          ),
          CreatedoctorBlogActions(),
        ],
      ),
    );
  }
}
