import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:template/core/api.dart';
import '../model/create_order_model.dart';

class CreateOrderController extends GetxController {
  ApiService apiService = ApiService();

  final model = CreateOrderModel().obs;

  final currentStep = 0.obs;

  final selectedTemplate = RxnInt();

  final isLoading = false.obs;

  //=============================
  // Text Controllers
  //=============================

  final patientNameController = TextEditingController();

  final shadeController = TextEditingController();

  final materialController = TextEditingController();

  final expectedDaysController = TextEditingController();

  final notesController = TextEditingController();

  //=============================
  // Step One
  //=============================

  void selectImpression(String value) {
    model.update((m) {
      m!.impressionType = value;
    });
  }

  void selectCaseType(String value) {
    model.update((m) {
      m!.caseType = value;
    });
  }

  void selectTemplate(int id) {
    selectedTemplate.value = id;

    model.update((m) {
      m!.templateId = id;
    });
  }

  void skipTemplate() {
    selectedTemplate.value = null;

    model.update((m) {
      m!.templateId = null;
    });
  }

  //=============================

  void nextStep() {
    model.update((m) {
      m!.patientName = patientNameController.text;

      m.shade = shadeController.text;

      m.material = materialController.text;

      m.expectedDays = int.tryParse(expectedDaysController.text) ?? 0;

      m.templateNotes = notesController.text;
    });

    currentStep.value = 1;
  }

  void previousStep() {
    currentStep.value = 0;
  }

  RxList<String> selectedTeeth = <String>[].obs;

  void toggleTooth(String tooth) {
    if (selectedTeeth.contains(tooth)) {
      selectedTeeth.remove(tooth);
    } else {
      selectedTeeth.add(tooth);
    }
  }

  final RxList<File> images = <File>[].obs;

  Future<void> pickImages() async {}

  void removeImage(int index) {
    images.removeAt(index);
  }

  final RxList<File> files = <File>[].obs;

  Future<void> pickFiles() async {}

  void removeFile(int index) {
    files.removeAt(index);
  }

  Future<void> submitOrder() async {
    model.update((m) {
      m?.selectedTeeth = selectedTeeth.toList().cast<int>();
      m?.images = images as List<String>;
      m?.digitalFiles = files as List<String>;
    });
  }

  @override
  void onClose() {
    patientNameController.dispose();
    shadeController.dispose();
    materialController.dispose();
    expectedDaysController.dispose();
    notesController.dispose();
    super.onClose();
  }

  Future<void> createOrder1(
    int labId, {
    required String title,
    required String shade,
    required bool isTemporary,
    required int impressionType,
    required bool isUrgent,
    required bool hasAccessories,
    required String deliveryDate,
    required String notes,
    required List<String> requiredImages,
    required String impressionStage,
  }) async {
    try {
      final response = await apiService.post(
        'CaseOrders/initiate/$labId',
        data: {
          'Title': title,
          'Shade': shade,
          'IsTemporary': isTemporary,
          'ImpressionType': impressionType,
          'IsUrgent': isUrgent,
          'HasAccessories': hasAccessories,
          'DeliveryDate': deliveryDate,
          'Notes': notes,
          'RequiredImages': requiredImages,
          'ImpressionStage': impressionType,
        },
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          'تم الإرسال',
          'تم إرسال الطلبية بنجاح',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          'خطأ',
          response.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'خطأ',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> createOrder2(
    int orderId, {
    required String compensationType,
    required List<int> toothNumbers,
  }) async {
    try {
      final Map<String, dynamic> data = {
        'CompensationType': compensationType,
      };
      for (int i = 0; i < toothNumbers.length; i++) {
        data['ToothNumbers[$i]'] = toothNumbers[i];
      }
      final response = await apiService.post(
        'CaseOrders/$orderId/add-item',
        data: data,
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          'تم الإرسال',
          'تم إرسال الطلبية بنجاح',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          'خطأ',
          response.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'خطأ',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
