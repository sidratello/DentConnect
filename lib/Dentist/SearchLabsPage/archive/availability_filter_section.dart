import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/search_labs_controller.dart';

class AvailabilityFilterSection extends StatelessWidget {
  const AvailabilityFilterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchLabsController>();

    return Obx(
      () => Material(
        color: Colors.transparent,
        child: SwitchListTile(
          value: controller.onlyAvailable.value,
          onChanged: (value) {
            controller.onlyAvailable.value = value;
          },
          title: const Text(
            'المخابر المتاحة فقط',
          ),
        ),
      ),
    );
  }
}
