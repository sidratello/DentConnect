import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/widgets/app_page_header_cases.dart';
import 'package:template/lab/features/lab_blog/controller/blog_feed_controller.dart';


class BlogFeedHeader
    extends StatelessWidget {
  const BlogFeedHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<BlogFeedController>();

    return AppPageHeader(
      title: 'المدونة',
      subtitle:
          'شارك واكتشف خبرات الأطباء والمخابر',
      icon: Icons.article_rounded,
      onBack: controller.goBack,
    );
  }
}