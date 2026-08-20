import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/widgets/app_page_header_cases.dart';

import '../../controller/create_blog_controller.dart';

class CreateBlogHeader extends StatelessWidget {
  const CreateBlogHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<CreateBlogController>();

    return Obx(
      () => AppPageHeader(
        title: controller.isEditMode
            ? 'تعديل المنشور'
            : 'إنشاء منشور جديد',
        subtitle: controller.isEditMode
            ? 'عدّل منشورك وأعد إرساله للمراجعة'
            : 'شارك خبرتك مع مجتمع المخابر',
        icon: controller.isEditMode
            ? Icons.edit_note_rounded
            : Icons.comment_rounded,
        onBack: controller.goBack,
      ),
    );
  }
}