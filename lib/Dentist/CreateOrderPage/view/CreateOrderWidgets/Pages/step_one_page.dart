import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/CreateOrderPage/controller/create_order_controller.dart';
import 'package:template/core/theme/app_colors.dart';
import '../Cards/order_type_card.dart';
import '../Cards/patient_info_card.dart';
import '../Cards/template_selector_card.dart';
import '../Shared/back_button.dart';
import '../Shared/next_button.dart';
import '../Shared/progress_header.dart';
import '../Shared/section_title.dart';

class StepOnePage extends GetView<CreateOrderController> {
  const StepOnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProgressHeader(
              currentStep: 1,
              totalSteps: 2,
            ),
            const SizedBox(height: 28),
            const SectionTitle(
              icon: Icons.print,
              title: "نوع الطبعة",
            ),
            const SizedBox(height: 4),
            OrderTypeCard(
              title: "طبعة عادية",
              subtitle: "Traditional Impression",
              icon: Icons.medical_information_outlined,
              isSelected: controller.model.value.impressionType == "normal",
              onTap: () {
                controller.selectImpression("normal");
              },
            ),
            const SizedBox(height: 12),
            OrderTypeCard(
              title: "طبعة رقمية",
              subtitle: "Digital Scan",
              icon: Icons.document_scanner_outlined,
              isSelected: controller.model.value.impressionType == "digital",
              onTap: () {
                controller.selectImpression("digital");
              },
            ),
            const SizedBox(height: 30),
            const SectionTitle(
              icon: Icons.category_outlined,
              title: "نوع الحالة",
            ),
            const SizedBox(height: 4),
            OrderTypeCard(
              title: "تجريبية",
              subtitle: "Trial",
              icon: Icons.science_outlined,
              isSelected: controller.model.value.caseType == "trial",
              onTap: () {
                controller.selectCaseType("trial");
              },
            ),
            const SizedBox(height: 12),
            OrderTypeCard(
              title: "نهائية",
              subtitle: "Final",
              icon: Icons.check_circle_outline,
              isSelected: controller.model.value.caseType == "final",
              onTap: () {
                controller.selectCaseType("final");
              },
            ),
            const SizedBox(height: 30),
            const SectionTitle(
              icon: Icons.person_outline,
              title: "المريض",
            ),
            const Text(
              "اختر مريضاً موجوداً أو أنشئ ملفاً جديداً",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<int>(
              decoration: InputDecoration(
                hintText: "اختر المريض",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(
                  Icons.people_outline,
                  color: AppColors.primary,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    color: AppColors.primary.withOpacity(.2),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 1.5,
                  ),
                ),
              ),
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text("محمد أحمد  (#1001)"),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text("علي خالد  (#1002)"),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text("سارة محمود  (#1003)"),
                ),
              ],
              onChanged: (value) {},
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.person_add_alt_1),
                label: const Text(
                  "إنشاء ملف مريض جديد",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  side: BorderSide(
                    color: AppColors.primary.withOpacity(.4),
                  ),
                  backgroundColor: AppColors.primary.withOpacity(.05),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const SectionTitle(
              icon: Icons.person_outline,
              title: "مخبر",
            ),
            const Text(
              "اختر مخبراً من القائمة",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<int>(
              decoration: InputDecoration(
                hintText: "اختر المخبر",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(
                  Icons.people_outline,
                  color: AppColors.primary,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    color: AppColors.primary.withOpacity(.2),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 1.5,
                  ),
                ),
              ),
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text(" Pearly Lab  (#1001)"),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text("Bright Lab   (#1002)"),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text(" Dental Lab  (#1003)"),
                ),
              ],
              onChanged: (value) {},
            ),
            const SizedBox(height: 18),
            const SectionTitle(
              icon: Icons.description_outlined,
              title: "اختر قالباً",
            ),
            const SizedBox(height: 16),
            TemplateSelectorCard(
              templateName: "Zircon Crown",
              description: "Shade A2 • 5 Days",
              isSelected: controller.selectedTemplate.value == 1,
              onTap: () {
                controller.selectTemplate(1);
              },
            ),
            const SizedBox(height: 12),
            TemplateSelectorCard(
              templateName: "E-Max Crown",
              description: "Shade B1 • 4 Days",
              isSelected: controller.selectedTemplate.value == 2,
              onTap: () {
                controller.selectTemplate(2);
              },
            ),
            TextButton(
              onPressed: controller.skipTemplate,
              child: const Text("تخطي"),
            ),
            const SizedBox(height: 10),
            const SectionTitle(
              icon: Icons.assignment_outlined,
              title: "معلومات الطلب",
            ),
            const SizedBox(height: 10),
            const PatientInfoCard(),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: BackButtonWidget(
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: NextButton(
                    onPressed: controller.nextStep,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
