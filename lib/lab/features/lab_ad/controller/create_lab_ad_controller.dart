import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:template/lab/features/add_scan_slot/controller/app_date_picker.dart';
import 'package:template/lab/features/lab_ad/repository/create_advertisement_response.dart';

import '../model/create_advertisement_response.dart';

class CreateLabAdController
    extends GetxController {
  final LabAdRepository _repository;
  final ImagePicker _imagePicker;

  CreateLabAdController({
    required LabAdRepository repository,
    ImagePicker? imagePicker,
  })  : _repository = repository,
        _imagePicker =
            imagePicker ?? ImagePicker();

  final formKey =
      GlobalKey<FormState>();

  final contentController =
      TextEditingController();

  final expirationDateController =
      TextEditingController();

  final selectedImages = <File>[].obs;

  final selectedExpirationDate =
      Rxn<DateTime>();

  final isSubmitting = false.obs;

  final createdAdvertisement =
      Rxn<CreateAdvertisementResponse>();

  @override
  void onClose() {
    contentController.dispose();
    expirationDateController.dispose();
    super.onClose();
  }

  Future<void> pickImages() async {
    try {
      final pickedImages =
          await _imagePicker
              .pickMultiImage(
        imageQuality: 90,
      );

      if (pickedImages.isEmpty) {
        return;
      }

      final newImages = pickedImages
          .where(
            (image) =>
                !_isImageSelected(
              image.path,
            ),
          )
          .map(
            (image) => File(image.path),
          );

      selectedImages.addAll(
        newImages,
      );
    } catch (_) {
      _showError(
        'تعذر اختيار الصور. تحقق من صلاحية الوصول إلى المعرض.',
      );
    }
  }

  void removeImage(int index) {
    if (index < 0 ||
        index >= selectedImages.length) {
      return;
    }

    selectedImages.removeAt(index);
  }

  Future<void> selectExpirationDate(
    BuildContext context,
  ) async {
    final now = DateTime.now();

    final tomorrow = DateTime(
      now.year,
      now.month,
      now.day + 1,
    );

    final pickedDate =
        await AppDatePicker.select(
      context,
      currentDate:
          selectedExpirationDate.value,
      textController:
          expirationDateController,
      firstDate: tomorrow,
      helpText:
          'اختر تاريخ انتهاء الإعلان',
      confirmText: 'تأكيد التاريخ',
      displayFormat: 'yyyy/MM/dd',
    );

    if (pickedDate == null) {
      return;
    }

    selectedExpirationDate.value =
        pickedDate;
  }

  Future<void> submit() async {
    FocusManager.instance.primaryFocus
        ?.unfocus();

    if (isSubmitting.value) {
      return;
    }

    final isValid =
        formKey.currentState?.validate() ??
            false;

    if (!isValid) {
      return;
    }

    final expiresAt =
        selectedExpirationDate.value;

    if (expiresAt == null) {
      _showError(
        'الرجاء اختيار تاريخ انتهاء الإعلان.',
      );
      return;
    }

    isSubmitting.value = true;

    try {
      final response =
          await _repository
              .createAdvertisement(
        content:
            contentController.text,
        expiresAt: expiresAt,
        images: List<File>.from(
          selectedImages,
        ),
      );

      if (!response.success ||
          response.data == null) {
        _showError(response.message);
        return;
      }

      createdAdvertisement.value =
          response.data;

      Get.back(
        result: response.data,
      );

      Get.snackbar(
        'تم إرسال الطلب',
        response.data!.message,
        snackPosition:
            SnackPosition.BOTTOM,
        margin:
            const EdgeInsets.all(16),
      );
    } finally {
      isSubmitting.value = false;
    }
  }

  void goBack() {
    if (!isSubmitting.value) {
      Get.back();
    }
  }

  bool _isImageSelected(
    String path,
  ) {
    return selectedImages.any(
      (image) =>
          image.path == path,
    );
  }

  void _showError(String message) {
    Get.snackbar(
      'تعذر إتمام العملية',
      message,
      snackPosition:
          SnackPosition.BOTTOM,
      margin:
          const EdgeInsets.all(16),
    );
  }
}