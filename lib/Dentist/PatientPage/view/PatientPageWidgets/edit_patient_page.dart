import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:template/Dentist/PatientPage/controller/patient_controller.dart';
import 'package:template/Dentist/PatientPage/model/patient_model.dart';

import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/static.dart';
import 'package:template/core/widgets/appbar_vector_black.dart';
import 'package:template/core/widgets/top_background.dart';

class EditPatientPage extends StatefulWidget {
  final PatientModel patient;

  const EditPatientPage({
    super.key,
    required this.patient,
  });

  @override
  State<EditPatientPage> createState() => _EditPatientPageState();
}

class _EditPatientPageState extends State<EditPatientPage> {
  final PatientController controller = Get.find<PatientController>();

  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final TextEditingController clinicalNotesController = TextEditingController();

  final TextEditingController processedTeethController =
      TextEditingController();

  final ImagePicker imagePicker = ImagePicker();

  final List<File> beforeImages = [];

  final List<File> afterImages = [];

  /// 0 = Before
  /// 1 = After
  int selectedPhotoType = 0;

  bool isSubmitting = false;

  @override
  void initState() {
    super.initState();

    fullNameController.text = widget.patient.fullName ?? '';

    ageController.text = widget.patient.age?.toString() ?? '';

    clinicalNotesController.text = widget.patient.clinicalNotes ?? '';
  }

  @override
  void dispose() {
    fullNameController.dispose();
    ageController.dispose();
    clinicalNotesController.dispose();
    processedTeethController.dispose();

    super.dispose();
  }

  Future<void> pickImages() async {
    try {
      final List<XFile> pickedImages = await imagePicker.pickMultiImage(
        imageQuality: 85,
      );

      if (pickedImages.isEmpty) {
        return;
      }

      setState(() {
        final List<File> targetList =
            selectedPhotoType == 0 ? beforeImages : afterImages;

        for (final image in pickedImages) {
          final File file = File(image.path);

          final bool alreadyExists = targetList.any(
            (existingImage) => existingImage.path == file.path,
          );

          if (!alreadyExists) {
            targetList.add(file);
          }
        }
      });
    } catch (e) {
      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء اختيار الصور',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void removeImage({
    required int index,
    required int type,
  }) {
    setState(() {
      if (type == 0) {
        if (index >= 0 && index < beforeImages.length) {
          beforeImages.removeAt(index);
        }
      } else {
        if (index >= 0 && index < afterImages.length) {
          afterImages.removeAt(index);
        }
      }
    });
  }

  bool validate() {
    if (fullNameController.text.trim().isEmpty) {
      _showError('يرجى إدخال اسم المريض');
      return false;
    }

    if (ageController.text.trim().isEmpty) {
      _showError('يرجى إدخال عمر المريض');
      return false;
    }

    final int? age = int.tryParse(
      ageController.text.trim(),
    );

    if (age == null || age <= 0) {
      _showError('يرجى إدخال عمر صحيح');
      return false;
    }

    return true;
  }

  void _showError(String message) {
    Get.snackbar(
      'بيانات ناقصة',
      message,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  Future<void> submit() async {
    if (!validate()) {
      return;
    }

    if (widget.patient.patientId == null) {
      _showError('معرف المريض غير موجود');
      return;
    }

    setState(() {
      isSubmitting = true;
    });

    bool success = true;

    if (beforeImages.isNotEmpty) {
      success = await controller.updatePatientData(
        widget.patient.patientId!,
        fullName: fullNameController.text.trim(),
        age: ageController.text.trim(),
        clinicalNotes: clinicalNotesController.text.trim(),
        processedTeeth: processedTeethController.text.trim(),
        newPhotos: beforeImages,
        newPhotosType: 0,
      );

      if (!success) {
        _finishSubmitting();
        return;
      }
    }

    if (afterImages.isNotEmpty) {
      success = await controller.updatePatientData(
        widget.patient.patientId!,
        fullName: fullNameController.text.trim(),
        age: ageController.text.trim(),
        clinicalNotes: clinicalNotesController.text.trim(),
        processedTeeth: processedTeethController.text.trim(),
        newPhotos: afterImages,
        newPhotosType: 1,
      );

      if (!success) {
        _finishSubmitting();
        return;
      }
    }

    if (beforeImages.isEmpty && afterImages.isEmpty) {
      success = await controller.updatePatientData(
        widget.patient.patientId!,
        fullName: fullNameController.text.trim(),
        age: ageController.text.trim(),
        clinicalNotes: clinicalNotesController.text.trim(),
        processedTeeth: processedTeethController.text.trim(),
        newPhotos: null,
        newPhotosType: null,
      );
    }

    if (!mounted) {
      return;
    }

    setState(() {
      isSubmitting = false;
    });

    if (success) {
      await controller.fetchPatientList();

      Get.back();
    }
  }

  void _finishSubmitting() {
    if (!mounted) {
      return;
    }

    setState(() {
      isSubmitting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceTintColor,
        surfaceTintColor: AppColors.surfaceTintColor,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: const [
          AppbarVectorBlack(),
        ],
        title: const Text(
          'تعديل بيانات المريض',
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w700,
            fontSize: 21,
          ),
        ),
      ),
      body: TopBackground(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(
              Static.getwidth(context, 20),
            ),
            child: Column(
              children: [
                _buildTextField(
                  context,
                  controller: fullNameController,
                  label: 'اسم المريض',
                  hint: 'أدخل اسم المريض',
                  icon: Icons.person_outline,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  context,
                  controller: ageController,
                  label: 'العمر',
                  hint: 'أدخل عمر المريض',
                  icon: Icons.cake_outlined,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  context,
                  controller: clinicalNotesController,
                  label: 'الملاحظات السريرية',
                  hint: 'أدخل الملاحظات السريرية',
                  icon: Icons.medical_information_outlined,
                  maxLines: 5,
                ),
                const SizedBox(height: 16),
                _buildPhotoTypeSelector(
                  context,
                ),
                const SizedBox(height: 16),
                _buildUploadSection(
                  context,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton.icon(
                    onPressed: isSubmitting ? null : submit,
                    icon: isSubmitting
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Icon(
                            Icons.save_outlined,
                          ),
                    label: Text(
                      isSubmitting ? 'جاري الحفظ...' : 'حفظ التعديلات',
                      style: const TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
          maxLines: maxLines,
          keyboardType: keyboardType,
          style: const TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontSize: 13,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              color: Colors.grey,
              fontSize: 12,
            ),
            prefixIcon: Icon(
              icon,
              color: AppColors.primary,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                14,
              ),
              borderSide: BorderSide(
                color: AppColors.primary.withValues(
                  alpha: .15,
                ),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                14,
              ),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1.4,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoTypeSelector(
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'نوع الصور الجديدة',
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _buildTypeButton(
                title: 'قبل العلاج',
                icon: Icons.photo_camera_front_outlined,
                value: 0,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildTypeButton(
                title: 'بعد العلاج',
                icon: Icons.photo_camera_back_outlined,
                value: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTypeButton({
    required String title,
    required IconData icon,
    required int value,
  }) {
    final bool selected = selectedPhotoType == value;

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        setState(() {
          selectedPhotoType = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 180,
        ),
        height: 52,
        decoration: BoxDecoration(
          color: selected
              ? AppColors.primary.withValues(
                  alpha: .08,
                )
              : Colors.white,
          borderRadius: BorderRadius.circular(
            14,
          ),
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.border,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: selected ? AppColors.primary : Colors.grey,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: selected ? AppColors.primary : Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadSection(
    BuildContext context,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.photo_library_outlined,
                color: AppColors.primary,
              ),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'إضافة صور جديدة',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                selectedPhotoType == 0 ? 'قبل العلاج' : 'بعد العلاج',
                style: const TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  color: AppColors.primary,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          InkWell(
            onTap: pickImages,
            borderRadius: BorderRadius.circular(
              14,
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 22,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(
                  alpha: .05,
                ),
                borderRadius: BorderRadius.circular(
                  14,
                ),
                border: Border.all(
                  color: AppColors.primary.withValues(
                    alpha: .3,
                  ),
                ),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.add_photo_alternate_outlined,
                    color: AppColors.primary,
                    size: 34,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'اختيار صور',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (beforeImages.isNotEmpty) ...[
            const SizedBox(height: 18),
            _buildSelectedImages(
              context,
              title: 'صور قبل العلاج',
              images: beforeImages,
              type: 0,
            ),
          ],
          if (afterImages.isNotEmpty) ...[
            const SizedBox(height: 18),
            _buildSelectedImages(
              context,
              title: 'صور بعد العلاج',
              images: afterImages,
              type: 1,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSelectedImages(
    BuildContext context, {
    required String title,
    required List<File> images,
    required int type,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              type == 0
                  ? Icons.photo_camera_front_outlined
                  : Icons.photo_camera_back_outlined,
              color: AppColors.primary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
            const Spacer(),
            Text(
              '${images.length} صور',
              style: const TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                color: AppColors.primary,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: images.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            final File file = images[index];

            return Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  child: Image.file(
                    file,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: InkWell(
                    onTap: () {
                      removeImage(
                        index: index,
                        type: type,
                      );
                    },
                    child: Container(
                      width: 26,
                      height: 26,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
