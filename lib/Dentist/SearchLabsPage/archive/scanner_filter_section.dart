import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core_dentist/theme/app_colors.dart';

import '../controller/search_labs_controller.dart';

class ScannerFilterSection extends StatelessWidget {
  const ScannerFilterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchLabsController>();

    return Obx(
      () => Material(
        color: AppColors.surfaceTintColor,
        child: SwitchListTile(
          value: controller.onlyScanner.value,
          onChanged: (value) {
            controller.onlyScanner.value = value;
          },
          title: const Text(
            'وجود ماسح متنقل',
          ),
        ),
      ),
    );
  }
}
