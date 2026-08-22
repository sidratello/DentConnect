import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/BlogDentists/controller/create_blog_controller.dart';

import 'package:template/core/widgets/app_page_header_cases.dart';

class CreateDoctorBlogHeader extends StatelessWidget {
  const CreateDoctorBlogHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateDoctorBlogController>();

    return Obx(
      () => AppPageHeader(
        title: controller.isEditMode ? 'تعديل المنشور' : 'إنشاء منشور جديد',
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
