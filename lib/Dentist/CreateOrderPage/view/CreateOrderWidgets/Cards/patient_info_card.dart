import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/CreateOrderPage/controller/create_order_controller.dart';

import '../Shared/custom_input_field.dart';
import '../Shared/info_card.dart';

class PatientInfoCard extends GetView<CreateOrderController> {
  const PatientInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInputField(
            label: "اللون",
            hint: "A1 / A2 ...",
            icon: Icons.palette_outlined,
            controller: controller.shadeController,
          ),
          const SizedBox(height: 18),
          CustomInputField(
            label: "المواد المستخدمة",
            hint: "مثال: Zircon",
            icon: Icons.science_outlined,
            controller: controller.materialController,
          ),
          const SizedBox(height: 18),
          CustomInputField(
            label: "المدة المتوقعة",
            hint: "عدد الأيام",
            icon: Icons.schedule_outlined,
            keyboardType: TextInputType.number,
            controller: controller.expectedDaysController,
          ),
        ],
      ),
    );
  }
}
