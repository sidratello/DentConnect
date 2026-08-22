import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/BlogDentists/controller/blog_feed_controller.dart';

import 'package:template/core/widgets/app_page_header_cases.dart';

class BlogDoctorFeedHeader extends StatelessWidget {
  const BlogDoctorFeedHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BlogFeedDoctorController>();

    return AppPageHeader(
      title: 'المدونة',
      subtitle: 'شارك واكتشف خبرات الأطباء والمخابر',
      icon: Icons.article_rounded,
      onBack: controller.goBack,
    );
  }
}
