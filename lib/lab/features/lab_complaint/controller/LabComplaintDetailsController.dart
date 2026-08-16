import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/lab/features/lab_complaint/controller/lab_complaints_controller.dart';
import 'package:template/lab/features/lab_complaint/repositry/lab_complaints_repository.dart';

import '../model/complaint_dentist_model.dart';
import '../model/lab_complaint_model.dart';

class LabComplaintDetailsController
    extends GetxController {
  final LabComplaintsRepository
      repository;

  LabComplaintDetailsController({
    required this.repository,
  });

  late final Rx<LabComplaintModel>
      complaint;

  final dentist =
      Rxn<ComplaintDentistModel>();

  final isLoadingDentist =
      false.obs;

  final isReplying =
      false.obs;

  final replyController =
      TextEditingController();

  @override
  void onInit() {
    super.onInit();

    final argument =
        Get.arguments;

    if (argument
        is! LabComplaintModel) {
      throw ArgumentError(
        'LabComplaintDetailsScreen requires LabComplaintModel.',
      );
    }

    complaint =
        argument.obs;

    getDentistDetails();
  }

  Future<void>
      getDentistDetails() async {
    if (isLoadingDentist.value) {
      return;
    }

    try {
      isLoadingDentist.value =
          true;

      final response =
          await repository
              .getDentistDetails(
        complaint.value.dentistId,
      );

      if (!response.success ||
          response.data == null) {
        Get.snackbar(
          'خطأ',
          response.message,
        );

        return;
      }

      dentist.value =
          ComplaintDentistModel
              .fromJson(
        response.data!,
      );
    } catch (error) {
      debugPrint(
        'Dentist details error: $error',
      );

      Get.snackbar(
        'خطأ',
        'تعذر تحميل بيانات الطبيب',
      );
    } finally {
      isLoadingDentist.value =
          false;
    }
  }
Future<void> submitReply() async {
  final reply =
      replyController.text.trim();

  if (reply.isEmpty) {
    Get.snackbar(
      'تنبيه',
      'يرجى كتابة الرد على الشكوى',
    );
    return;
  }

  if (isReplying.value) {
    return;
  }

  try {
    isReplying.value = true;

    final response =
        await repository
            .replyToComplaint(
      complaintId:
          complaint.value.id,
      reply: reply,
    );

    if (!response.success ||
        response.data == null) {
      Get.snackbar(
        'خطأ',
        response.message,
      );
      return;
    }

    complaint.value =
        LabComplaintModel.fromJson(
      response.data!,
    );

    if (Get.isRegistered<
        LabComplaintsController>()) {
      Get.find<
              LabComplaintsController>()
          .updateComplaint(
        complaint.value,
      );
    }

    replyController.clear();

    // إغلاق BottomSheet فقط
    Get.back();

    Get.snackbar(
      'تم',
      'تم إرسال الرد بنجاح',
    );
  } finally {
    isReplying.value = false;
  }
}

  bool get isAnswered =>
      complaint.value.isAnswered;
void goBack() {
  Get.back(
    result: complaint.value,
  );
}

  @override
  void onClose() {
    replyController.dispose();

    super.onClose();
  }
}