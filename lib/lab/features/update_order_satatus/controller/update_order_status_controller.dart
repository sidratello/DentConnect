import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:template/lab/shared/models/lab_order_model.dart';

import '../repositry/update_order_status_repo.dart';

class UpdateOrderStatusController extends GetxController {
  final UpdateOrderStatusRepo _repo = UpdateOrderStatusRepo();

  final notesController = TextEditingController();

  final isLoading = false.obs;
  final selectedStatus = 0.obs;
  final selectedImage = Rxn<File>();

  late final LabOrderModel order;

  final statuses = [
    {'id': 1, 'title': 'مقبول', 'status': 'Accepted'},
    {'id': 2, 'title': 'طلب معلومات إضافية', 'status': 'RequestInfo'},
    {'id': 3, 'title': 'قيد التصميم', 'status': 'InDesign'},
    {'id': 4, 'title': 'قيد الإنتاج', 'status': 'InProduction'},
    {'id': 5, 'title': ' قيد التلوين', 'status': 'InColoring'},
    {'id': 6, 'title': 'جاهز للتسليم', 'status': 'Ready'},
    {'id': 7, 'title': 'تم التسليم', 'status': 'Delivered'},
    {'id': 8, 'title': 'ملغي', 'status': 'Cancelled'},
  ];

  @override
  void onInit() {
    super.onInit();

    order = Get.arguments as LabOrderModel;
    selectedStatus.value = statusId(order.status);
  }

  int statusId(String status) {
    switch (status) {
      case 'Accepted':
        return 1;
      case 'RequestInfo':
        return 2;
      case 'InDesign':
        return 3;
      case 'InProduction':
        return 4;
      case 'InColoring':
        return 5;
      case 'Ready':
        return 6;
      case 'Delivered':
        return 7;
      case 'Cancelled':
        return 8;
      default:
        return 1;
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();

    final image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  void removeImage() {
    selectedImage.value = null;
  }

  Future<void> updateStatus() async {
    if (selectedStatus.value == 0) {
      Get.snackbar('تنبيه', 'يرجى اختيار الحالة الجديدة');
      return;
    }

    isLoading.value = true;

    final response = await _repo.updateOrderStatus(
      orderId: order.orderId,
      status: selectedStatus.value,
      notes: notesController.text,
      resultImage: selectedImage.value,
    );

    isLoading.value = false;

if (response.success && response.data != null) {
  Get.back(
    result: response.data,
  );

  Get.snackbar(
    'نجاح',
    'تم تحديث حالة الطلب',
    snackPosition:
        SnackPosition.BOTTOM,
  );
}else {
      Get.snackbar('خطأ', response.message);
    }
  }

  @override
  void onClose() {
    notesController.dispose();
    super.onClose();
  }
}