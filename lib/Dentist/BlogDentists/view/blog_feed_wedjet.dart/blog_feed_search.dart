import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/BlogDentists/controller/blog_feed_controller.dart';

import 'package:template/core/widgets/app_search_field.dart';

class BlogDoctorFeedSearch extends GetView<BlogFeedDoctorController> {
  const BlogDoctorFeedSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppSearchField(
        controller: controller.searchController,
        hintText: 'ابحث باسم الكاتب أو عنوان المنشور',
        onChanged: controller.onSearchChanged,
        onClear: controller.hasSearchQuery ? controller.clearSearch : null,
      ),
    );
  }
}
