import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/CreateOrderPage/controller/create_order_controller.dart';
import 'package:template/Dentist/PatientPage/view/PatientPageWidgets/upload_field.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/static.dart';
import 'package:template/core/widgets/app_text_field.dart';
import 'package:template/core/widgets/appbar_vector_black.dart';
import 'package:template/core/widgets/top_background.dart';

import '../../../core/widgets/app_spacing.dart';

class CreateNewPatientProfile extends GetView<CreateOrderController> {
  final int? id;

  const CreateNewPatientProfile({
    this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,

      // ==========================================================
      // APP BAR
      // ==========================================================

      appBar: AppBar(
        backgroundColor: AppColors.surfaceTintColor,
        surfaceTintColor: AppColors.surfaceTintColor,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: const [
          AppbarVectorBlack(),
        ],
        title: Text(
          'ملف مريض جديد',
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w700,
            fontSize: Static.getwidth(context, 22),
          ),
        ),
      ),

      // ==========================================================
      // BODY
      // ==========================================================

      body: TopBackground(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: Static.getwidth(context, 24),
            ),
            child: Column(
              children: [
                AppSpacing.height(context, 16),

                // ==================================================
                // Patient Name
                // ==================================================

                AppTextField(
                  hint: 'اسم المريض',
                  controller: controller.patientNameController,
                ),

                AppSpacing.height(context, 12),

                // ==================================================
                // Patient Age
                // ==================================================

                AppTextField(
                  hint: 'عمر المريض',
                  controller: controller.patientAgeController,
                  keyboardType: TextInputType.number,
                ),

                AppSpacing.height(context, 12),

                // ==================================================
                // Clinical Notes
                // ==================================================

                AppTextField(
                  hint: 'ملاحظات سريرية عن أمراضه وما يخص حالة أسنانه',
                  controller: controller.patientClinicalNotesController,
                  maxLines: 4,
                ),

                AppSpacing.height(context, 16),

                // ==================================================
                // Upload Images
                // ==================================================

                UploadField(
                  title: 'صور لأسنانه حالياً',
                  onTap: controller.pickImagesPatient,
                ),

                // ==================================================
                // Selected Images
                // ==================================================

                Obx(
                  () {
                    if (controller.patientImages.isEmpty) {
                      return const SizedBox();
                    }

                    return Column(
                      children: [
                        AppSpacing.height(context, 16),
                        _buildImagesGrid(context),
                      ],
                    );
                  },
                ),

                AppSpacing.height(context, 24),

                // ==================================================
                // Create Patient
                // ==================================================

                InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: _createPatient,
                  child: Container(
                    width: double.infinity,
                    height: Static.getheight(
                      context,
                      54,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Center(
                      child: Text(
                        'إنشاء الملف',
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans Arabic',
                          fontWeight: FontWeight.w600,
                          fontSize: Static.getwidth(
                            context,
                            16,
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                AppSpacing.height(context, 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ==============================================================
  // IMAGES GRID
  // ==============================================================

  Widget _buildImagesGrid(
    BuildContext context,
  ) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.patientImages.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final File image = controller.patientImages[index];

        return Stack(
          children: [
            // ------------------------------------------------------
            // Image
            // ------------------------------------------------------

            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.file(
                image,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            // ------------------------------------------------------
            // Delete
            // ------------------------------------------------------

            Positioned(
              top: 5,
              right: 5,
              child: GestureDetector(
                onTap: () {
                  controller.removeImagePatient(
                    index,
                  );
                },
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                    size: 17,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _createPatient() {
    final String fullName = controller.patientNameController.text.trim();

    final String age = controller.patientAgeController.text.trim();

    final String clinicalNotes =
        controller.patientClinicalNotesController.text.trim();

    if (fullName.isEmpty) {
      _showError('يرجى إدخال اسم المريض');
      return;
    }

    if (age.isEmpty) {
      _showError('يرجى إدخال عمر المريض');
      return;
    }

    if (id == null) {
      _showError('لم يتم تحديد رقم الحالة');
      return;
    }

    controller.addNewPatient(
      controller.createdOrderId.value!,
      fullName: fullName,
      age: age,
      clinicalNotes: clinicalNotes,
      processedTeeth: '0',
      photos: controller.patientImages,
    );
  }

  void _showError(String message) {
    Get.snackbar(
      'تنبيه',
      message,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
    );
  }
}
