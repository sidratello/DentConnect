import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/app_button.dart';

import '../../controller/create_blog_controller.dart';

class CreateBlogActions extends StatelessWidget {
  const CreateBlogActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<CreateBlogController>();

    return Obx(
      () => SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            20,
            10,
            20,
            14,
          ),
          child: AppButton(
            title: 'إرسال للمراجعة',
            type: AppButtonType.gradient,
            height: 54,
            borderRadius: 12,
            isLoading: controller.isSubmitting.value,
            enabled: !controller.isSubmitting.value,
            onTap: controller.submit,
            icon: const Icon(
              Icons.send_rounded,
              color: AppColors.white,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }
}