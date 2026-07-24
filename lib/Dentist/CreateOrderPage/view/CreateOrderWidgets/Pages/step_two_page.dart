import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/CreateOrderPage/controller/create_order_controller.dart';
import '../Shared/back_button.dart';
import '../Shared/custom_choice_chip.dart';
import '../Shared/custom_date_field.dart';
import '../Shared/custom_switch_tile.dart';
import '../Shared/next_button.dart';
import '../Shared/progress_header.dart';

import '../Teeth/teeth_selector.dart';

import '../Upload/upload_files_card.dart';
import '../Upload/upload_images_card.dart';

class StepTwoPage extends GetView<CreateOrderController> {
  const StepTwoPage({super.key});

  final List<String> restorationTypes = const [
    "Crown",
    "Bridge",
    "Veneer",
    "Inlay",
    "Onlay",
    "Implant",
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProgressHeader(
              currentStep: 2,
              totalSteps: 2,
            ),

            const SizedBox(height: 30),

            /// الأسنان
            const TeethSelector(),

            const SizedBox(height: 28),

            /// نوع الترميم

            Text(
              "نوع الترميم",
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 14),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: restorationTypes.map((type) {
                return CustomChoiceChip(
                  title: type,
                  icon: Icons.medical_services_outlined,
                  isSelected: controller.model.value.restorationType == type,
                  onTap: () {
                    controller.model.update((m) {
                      m?.restorationType = type;
                    });
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 28),

            /// الصور

            const UploadImagesCard(),

            const SizedBox(height: 28),

            /// ملفات الطبعة

            const UploadFilesCard(),

            const SizedBox(height: 28),

            /// Accessories

            CustomSwitchTile(
              title: "يوجد اكسسوارات مستخدمة ",
              subtitle: "الوصلات الكروية - الوصلات الشريطية - ... ",
              icon: Icons.inventory_2_outlined,
              value: controller.model.value.hasAccessory,
              onChanged: (value) {
                controller.model.update((m) {
                  m?.hasAccessory = value;
                });
              },
            ),

            const SizedBox(height: 18),

            /// Urgent

            CustomSwitchTile(
              title: "طلب مستعجل",
              subtitle: "سيتم إعطاء الطلب أولوية",
              icon: Icons.priority_high_rounded,
              value: controller.model.value.isUrgent,
              onChanged: (value) {
                controller.model.update((m) {
                  m?.isUrgent = value;
                });
              },
            ),

            const SizedBox(height: 28),

            /// تاريخ الإرسال

            CustomDateField(
              label: "تاريخ الإرسال",
              hint: "اختر تاريخ الإرسال",
              selectedDate: controller.model.value.sendDate,
              onDateSelected: (date) {
                controller.model.update((m) {
                  m?.sendDate = date;
                });
              },
            ),

            const SizedBox(height: 18),

            /// تاريخ التسليم

            CustomDateField(
              label: "تاريخ التسليم",
              hint: "اختر تاريخ التسليم",
              selectedDate: controller.model.value.deliveryDate,
              onDateSelected: (date) {
                controller.model.update((m) {
                  m?.deliveryDate = date;
                });
              },
            ),

            const SizedBox(height: 36),

            Row(
              children: [
                Expanded(
                  child: BackButtonWidget(
                    onPressed: controller.previousStep,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: NextButton(
                    text: "إرسال الطلب",
                    onPressed: controller.submitOrder,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
