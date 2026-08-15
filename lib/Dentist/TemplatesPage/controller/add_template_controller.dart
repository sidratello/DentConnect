import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/TemplatesPage/controller/template_controller.dart';
import 'package:template/Dentist/TemplatesPage/model/template_model.dart';

class AddTemplateController extends GetxController {
  //------------------------------------
  // Text Controllers
  //------------------------------------

  final titleController = TextEditingController();
  final workTypeController = TextEditingController();
  final shadeController = TextEditingController();
  final impressionController = TextEditingController();
  final deliveryDaysController = TextEditingController();

  //------------------------------------
  // Temporary Controllers
  //------------------------------------

  final materialController = TextEditingController();
  final imageController = TextEditingController();
  final noteController = TextEditingController();

  //------------------------------------
  // Lists
  //------------------------------------

  final RxList<String> materials = <String>[].obs;
  final RxList<String> requiredImages = <String>[].obs;
  final RxList<String> notes = <String>[].obs;

  //------------------------------------
  // Switches
  //------------------------------------

  final RxBool isUrgent = false.obs;
  final RxBool needsTryIn = false.obs;

  //------------------------------------
  // Add Material
  //------------------------------------

  void addMaterial() {
    final value = materialController.text.trim();

    if (value.isEmpty) return;

    materials.add(value);

    materialController.clear();
  }

  //------------------------------------
  // Remove Material
  //------------------------------------

  void removeMaterial(int index) {
    materials.removeAt(index);
  }

  //------------------------------------
  // Add Image
  //------------------------------------

  void addImage() {
    final value = imageController.text.trim();

    if (value.isEmpty) return;

    requiredImages.add(value);

    imageController.clear();
  }

  //------------------------------------
  // Remove Image
  //------------------------------------

  void removeImage(int index) {
    requiredImages.removeAt(index);
  }

  //------------------------------------
  // Add Note
  //------------------------------------

  void addNote() {
    final value = noteController.text.trim();

    if (value.isEmpty) return;

    notes.add(value);

    noteController.clear();
  }

  //------------------------------------
  // Remove Note
  //------------------------------------

  void removeNote(int index) {
    notes.removeAt(index);
  }

  //------------------------------------
  // Save Template
  //------------------------------------

  void saveTemplate() {
    if (titleController.text.trim().isEmpty) {
      Get.snackbar(
        "تنبيه",
        "يرجى إدخال اسم القالب",
      );
      return;
    }

    final template = CaseTemplate(
      id: 0,
      title: titleController.text.trim(),
      workType: workTypeController.text.trim(),
      materials: materials.toList(),
      defaultShade: shadeController.text.trim(),
      preferredImpression: impressionController.text.trim(),
      requiredImages: requiredImages.toList(),
      deliveryDays: int.tryParse(deliveryDaysController.text.trim()) ?? 0,
      notes: notes.toList(),
      isUrgent: isUrgent.value,
      needsTryIn: needsTryIn.value,
    );

    Get.find<TemplateController>().addTemplate(template);

    Get.back();

    Get.snackbar(
      "تم الحفظ",
      "تمت إضافة القالب بنجاح",
    );
  }

  @override
  void onClose() {
    titleController.dispose();
    workTypeController.dispose();
    shadeController.dispose();
    impressionController.dispose();
    deliveryDaysController.dispose();

    materialController.dispose();
    imageController.dispose();
    noteController.dispose();

    super.onClose();
  }
}
