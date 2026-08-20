import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_router.dart';

import 'package:template/lab/features/lab_ad/view/wedjet_lab_ad_feed/lab_ad_feed_body.dart';
import 'package:template/lab/features/lab_blog/view/blog_feed_wedjet.dart/blog_add_post_button.dart';
import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';

class LabAdFeedScreen
    extends StatelessWidget {
  const LabAdFeedScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LabBackgroundLayout(
      child: Stack(
        children: [
          const LabAdFeedBody(),

          Positioned(
            right: 20,
            bottom: 20,
            child: BlogAddPostButton(
              onPressed: () {
                Get.toNamed(
                  AppRouter.createLabAd,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}