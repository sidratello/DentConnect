import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/TemplatesPage/controller/add_template_controller.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/utils/static.dart';

class AddTemplateOptionsCard extends GetView<AddTemplateController> {
  const AddTemplateOptionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        Static.getwidth(context, 18),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Obx(
            () => SwitchListTile(
              value: controller.isUrgent.value,
              onChanged: (value) {
                controller.isUrgent.value = value;
              },
              title: const Text(
                'حالة مستعجلة',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                ),
              ),
            ),
          ),
          Obx(
            () => SwitchListTile(
              value: controller.needsTryIn.value,
              onChanged: (value) {
                controller.needsTryIn.value = value;
              },
              title: const Text(
                'تحتاج تجربة',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
