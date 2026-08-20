



import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/app_button.dart';
import 'package:template/lab/features/add_scan_slot/controller/add_scan_slot_controller.dart';

class SaveScanSlotButton extends StatelessWidget {
  const SaveScanSlotButton();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddScanSlotController>();

    return Obx(
      () => AppButton(
        title: 'حفظ الموعد',
        type: AppButtonType.gradient,
        height: 56,
        borderRadius: 14,
        isLoading: controller.isLoading.value,
        icon: const Icon(
          Icons.check_circle_outline_rounded,
          color: AppColors.white,
          size: 22,
        ),
        onTap: controller.createScanSlot,
      ),
    );
  }
}