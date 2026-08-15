import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../controller/search_labs_controller.dart';

class CityFilterSection extends StatelessWidget {
  const CityFilterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchLabsController>();

    return Obx(
      () => DropdownButtonFormField<String>(
        initialValue: controller.selectedCity.value.isEmpty
            ? null
            : controller.selectedCity.value,
        decoration: const InputDecoration(
          labelText: 'الموقع',
          filled: true,
          fillColor: AppColors.white,
        ),
        items: controller.cities
            .map(
              (city) => DropdownMenuItem(
                value: city,
                child: Text(city),
              ),
            )
            .toList(),
        onChanged: (value) {
          controller.selectedCity.value = value ?? '';
        },
      ),
    );
  }
}
