import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/app_button.dart';

import '../../controller/create_lab_ad_controller.dart';

class CreateLabAdActions
    extends GetView<CreateLabAdController> {
  const CreateLabAdActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        12,
        20,
        14 +
            MediaQuery.paddingOf(
              context,
            ).bottom,
      ),
      decoration: BoxDecoration(
        color: AppColors.background
            .withOpacity(.97),
        border: Border(
          top: BorderSide(
            color: AppColors.littleBlue
                .withOpacity(.65),
          ),
        ),
      ),
      child: Obx(
        () => AppButton(
          title: 'إرسال الطلب',
          onTap: controller.submit,
          type:
              AppButtonType.gradient,
          isLoading:
              controller.isSubmitting.value,
          enabled:
              !controller
                  .isSubmitting.value,
          height: 52,
          borderRadius: 13,
          icon: const Icon(
            Icons.send_rounded,
            color: AppColors.white,
            size: 21,
          ),
        ),
      ),
    );
  }
}