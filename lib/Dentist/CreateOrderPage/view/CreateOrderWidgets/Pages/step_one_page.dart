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
            // ==================================================
            // Title
            // ==================================================

            const SectionTitle(
              icon: Icons.title_rounded,
              title: 'عنوان الطلب',
            ),

            const SizedBox(height: 10),

            TextField(
              controller: controller.titleController,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: 'أدخل عنوان الطلب',
                hintStyle: const TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontSize: 12,
                  color: Colors.grey,
                ),
                prefixIcon: const Icon(
                  Icons.title_rounded,
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
                    color: AppColors.primary.withValues(
                      alpha: .2,
                    ),
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
            ),

            const SizedBox(height: 28),

            // ==================================================
            // Progress
            // ==================================================

            const ProgressHeader(
              currentStep: 1,
              totalSteps: 2,
            ),

            const SizedBox(height: 28),

            // ==================================================
            // Impression Type
            // ==================================================

            const SectionTitle(
              icon: Icons.print,
              title: 'نوع الطبعة',
            ),

            const SizedBox(height: 4),

            OrderTypeCard(
              title: 'طبعة عادية',
              subtitle: 'Traditional Impression',
              icon: Icons.medical_information_outlined,
              isSelected:
                  controller.model.value.impressionType == 'traditional',
              onTap: () {
                controller.selectImpression('traditional');
              },
            ),

            const SizedBox(height: 12),

            OrderTypeCard(
              title: 'طبعة رقمية',
              subtitle: 'Digital Scan',
              icon: Icons.document_scanner_outlined,
              isSelected: controller.model.value.impressionType == 'digital',
              onTap: () {
                controller.selectImpression('digital');
              },
            ),

            const SizedBox(height: 30),

            // ==================================================
            // Case Type
            // ==================================================

            const SectionTitle(
              icon: Icons.category_outlined,
              title: 'نوع الحالة',
            ),

            const SizedBox(height: 4),

            OrderTypeCard(
              title: 'تجريبية',
              subtitle: 'Trial',
              icon: Icons.science_outlined,
              isSelected: controller.model.value.caseType == 'trial',
              onTap: () {
                controller.selectCaseType('trial');
              },
            ),

            const SizedBox(height: 12),

            OrderTypeCard(
              title: 'نهائية',
              subtitle: 'Final',
              icon: Icons.check_circle_outline,
              isSelected: controller.model.value.caseType == 'final',
              onTap: () {
                controller.selectCaseType('final');
              },
            ),

            const SizedBox(height: 30),

            // ==================================================
            // Lab
            // ==================================================

            const SectionTitle(
              icon: Icons.person_outline,
              title: 'مخبر',
            ),

            const Text(
              'اختر مخبراً من القائمة',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 10),

            Obx(
              () {
                if (controller.isLoadingLabs.value) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: .2),
                      ),
                    ),
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          'جاري تحميل المخابر...',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                if (controller.labsDetails.isEmpty) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.orange.withValues(
                        alpha: .08,
                      ),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.orange.withValues(
                          alpha: .2,
                        ),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.orange,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'لا يوجد مخابر متاحة حاليًا',
                          style: TextStyle(
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return DropdownButtonFormField<int>(
                  initialValue: null,
                  isExpanded: true,
                  decoration: InputDecoration(
                    hintText: 'اختر المخبر',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    prefixIcon: const Icon(
                      Icons.business_outlined,
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
                        color: AppColors.primary.withValues(alpha: .2),
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
                  items: controller.labsDetails.map(
                    (lab) {
                      return DropdownMenuItem<int>(
                        value: lab.id,
                        child: Text(
                          '${lab.name}  (#${lab.id})',
                          style: const TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    controller.selectedLabId.value = value;
                  },
                );
              },
            ),

            const SizedBox(height: 18),

            // ==================================================
            // Templates
            // ==================================================

            const SectionTitle(
              icon: Icons.description_outlined,
              title: 'اختر قالباً',
            ),

            const SizedBox(height: 16),

            Obx(
              () {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.templates.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final template = controller.templates[index];

                    final templateId = index + 1;

                    return TemplateSelectorCard(
                      templateName: template.title,
                      description: '${template.defaultShade} • '
                          '${template.deliveryDays} Days',
                      isSelected:
                          controller.selectedTemplate.value == templateId,
                      onTap: () {
                        controller.selectTemplate(
                          templateId,
                        );
                      },
                    );
                  },
                );
              },
            ),

            TextButton(
              onPressed: controller.skipTemplate,
              child: const Text(
                'تخطي',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                ),
              ),
            ),

            const SizedBox(height: 10),

            // ==================================================
            // Order Information
            // ==================================================

            const SectionTitle(
              icon: Icons.assignment_outlined,
              title: 'معلومات الطلب',
            ),

            const SizedBox(height: 10),

            const PatientInfoCard(),

            const SizedBox(height: 30),

            // ==================================================
            // Navigation
            // ==================================================

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
