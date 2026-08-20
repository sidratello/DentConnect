import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/TemplatesPage/controller/add_template_controller.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/utils/static.dart';

class AddTemplateBasicInfoCard extends GetView<AddTemplateController> {
  const AddTemplateBasicInfoCard({super.key});

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
          TextField(
            controller: controller.titleController,
            decoration: const InputDecoration(
              labelText: 'اسم القالب',
              prefixIcon: Icon(Icons.description_outlined),
            ),
          ),
          const SizedBox(height: 18),
          TextField(
            controller: controller.workTypeController,
            decoration: const InputDecoration(
              labelText: 'نوع العمل',
              prefixIcon: Icon(Icons.medical_services_outlined),
            ),
          ),
          const SizedBox(height: 18),
          TextField(
            controller: controller.shadeController,
            decoration: const InputDecoration(
              labelText: 'اللون الافتراضي',
              prefixIcon: Icon(Icons.palette_outlined),
            ),
          ),
          const SizedBox(height: 18),
          TextField(
            controller: controller.impressionController,
            decoration: const InputDecoration(
              labelText: 'نوع الطبعة',
              prefixIcon: Icon(Icons.print_outlined),
            ),
          ),
          const SizedBox(height: 18),
          TextField(
            controller: controller.deliveryDaysController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'مدة التسليم بالأيام',
              prefixIcon: Icon(Icons.schedule_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
