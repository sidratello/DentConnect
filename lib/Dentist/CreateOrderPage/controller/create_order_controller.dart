import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/create_order_model.dart';

class CreateOrderController extends GetxController {
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

  Future<void> pickImages() async {
    // لاحقاً سنربط ImagePicker
  }

  void removeImage(int index) {
    images.removeAt(index);
  }

  final RxList<File> files = <File>[].obs;

  Future<void> pickFiles() async {
    // سنربط FilePicker لاحقاً
  }

  void removeFile(int index) {
    files.removeAt(index);
  }

  Future<void> submitOrder() async {
    model.update((m) {
      m?.selectedTeeth = selectedTeeth.toList().cast<int>();
      m?.images = images as List<String>;
      m?.digitalFiles = files as List<String>;
    });

    print(model.value.toJson());

    // هون لاحقاً رح نستدعي الـ Repository
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
}
