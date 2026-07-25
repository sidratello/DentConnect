import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/widgets/app_search_field.dart';
import 'package:template/lab/features/lab_blog/controller/blog_feed_controller.dart';



class BlogFeedSearch
    extends GetView<BlogFeedController> {
  const BlogFeedSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppSearchField(
        controller:
            controller.searchController,
        hintText:
            'ابحث باسم الكاتب أو عنوان المنشور',
        onChanged:
            controller.onSearchChanged,
        onClear:
            controller.hasSearchQuery
                ? controller.clearSearch
                : null,
      ),
    );
  }
}