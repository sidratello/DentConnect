import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/app_button.dart';

import '../../controller/update_scan_slot_controller.dart';

class UpdateScanSlotButton
    extends StatelessWidget {
  const UpdateScanSlotButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<UpdateScanSlotController>();

    return Obx(
      () => AppButton(
        title: 'حفظ التعديلات',
        type: AppButtonType.gradient,
        height: 56,
        borderRadius: 14,
        isLoading:
            controller.isLoading.value,
        icon: const Icon(
          Icons.check_circle_outline_rounded,
          color: AppColors.white,
          size: 22,
        ),
        onTap: controller.isLoading.value
            ? null
            : controller.updateScanSlot,
      ),
    );
  }
}