import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:template/lab/features/lab_blog/view/creat_post_wedjet/create_blog_actions.dart';
import 'package:template/lab/features/lab_blog/view/creat_post_wedjet/create_blog_body.dart';

import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart' show LabBackgroundLayout;

import '../controller/create_blog_controller.dart';

class CreateBlogScreen extends StatelessWidget {
  const CreateBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CreateBlogController>();

    return const LabBackgroundLayout(
      child: Column(
        children: [
  
          Expanded(
            child: CreateBlogBody(),
          ),
          CreateBlogActions(),
        ],
      ),
    );
  }
}