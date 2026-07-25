import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/widgets/app_page_header_cases.dart';

class BlogPostDetailsHeader
    extends StatelessWidget {
  const BlogPostDetailsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppPageHeader(
      title: 'تفاصيل المنشور',
      subtitle:
          'عرض محتوى المنشور والصور المرفقة',
      icon: Icons.article_outlined,
      onBack: Get.back,
    );
  }
}