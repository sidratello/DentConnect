import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_router.dart';
import 'package:template/lab/features/lab_complaint/repositry/lab_complaints_repository.dart';

import '../model/lab_complaint_model.dart';

enum ComplaintsTab {
  unanswered,
  answered,
}

class LabComplaintsController
    extends GetxController {
  final LabComplaintsRepository
      repository;

  LabComplaintsController({
    required this.repository,
  });

  final isLoading = false.obs;

  final selectedTab =
      ComplaintsTab.unanswered.obs;

  final complaints =
      <LabComplaintModel>[].obs;

  List<LabComplaintModel>
      get unansweredComplaints {
    return complaints
        .where(
          (complaint) =>
              !complaint.isAnswered,
        )
        .toList();
  }

  List<LabComplaintModel>
      get answeredComplaints {
    return complaints
        .where(
          (complaint) =>
              complaint.isAnswered,
        )
        .toList();
  }

  List<LabComplaintModel>
      get currentComplaints {
    switch (selectedTab.value) {
      case ComplaintsTab.unanswered:
        return unansweredComplaints;

      case ComplaintsTab.answered:
        return answeredComplaints;
    }
  }

  int get unansweredCount =>
      unansweredComplaints.length;

  int get answeredCount =>
      answeredComplaints.length;

  @override
  void onInit() {
    super.onInit();

    getComplaints();
  }

  Future<void>
      getComplaints() async {
    if (isLoading.value) {
      return;
    }

    try {
      isLoading.value = true;

      final response =
          await repository
              .getComplaints();

      if (!response.success ||
          response.data == null) {
        Get.snackbar(
          'خطأ',
          response.message,
        );

        return;
      }

      complaints.assignAll(
        response.data!
            .map(
              (item) =>
                  LabComplaintModel
                      .fromJson(
                Map<String, dynamic>.from(
                  item,
                ),
              ),
            )
            .toList(),
      );
    } catch (error) {
      debugPrint(
        'Complaints error: $error',
      );

      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء تحميل الشكاوى',
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void>
      refreshComplaints() {
    return getComplaints();
  }

  void selectTab(
    ComplaintsTab tab,
  ) {
    selectedTab.value = tab;
  }

Future<void> openComplaint(
  LabComplaintModel selectedComplaint,
) async {
  final result = await Get.toNamed(
    AppRouter.labComplaintDetails,
    arguments: selectedComplaint,
  );

  if (result is LabComplaintModel) {
    final index = complaints.indexWhere(
      (item) =>
          item.id == result.id,
    );

    if (index == -1) {
      return;
    }

    complaints[index] = result;

    complaints.refresh();
  }
}

void updateComplaint(
  LabComplaintModel updatedComplaint,
) {
  final index =
      complaints.indexWhere(
    (item) =>
        item.id ==
        updatedComplaint.id,
  );

  if (index == -1) {
    return;
  }

  complaints[index] =
      updatedComplaint;

  complaints.refresh();
}

  void goBack() {
    Get.back();
  }
}