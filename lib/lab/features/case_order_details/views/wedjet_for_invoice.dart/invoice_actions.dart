
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/app_button.dart';
import 'package:template/lab/features/case_order_details/controller/case_order_details_controller.dart';


class InvoiceActions extends StatelessWidget {
  final CaseOrderDetailsController controller;

  const InvoiceActions({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return AppButton(
            title: 'تعديل السعر النهائي',
            type: AppButtonType.filled,
            height: 52,
            isLoading: controller.isUpdatingPrice.value,
            enabled: !controller.isUpdatingPrice.value,
            icon: const Icon(
              Icons.edit_outlined,
              color: AppColors.white,
              size: 20,
            ),
            onTap: () {
              controller.updateFinalPrice(
                controller.finalPriceController.text,
              );
            },
          );
        }),
        const SizedBox(height: 12),
        AppButton(
          title: 'عودة لتفاصيل الطلب',
          type: AppButtonType.outlined,
          height: 52,
          textColor: AppColors.primaryBlue,
          borderColor: AppColors.primaryBlue,
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: AppColors.primaryBlue,
            size: 20,
          ),
          onTap: () => Get.back(),
        ),
      ],
    );
  }
}