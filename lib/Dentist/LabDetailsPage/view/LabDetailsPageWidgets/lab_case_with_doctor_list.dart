import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/LabDetailsPage/controller/lab_controller.dart';
import 'package:template/Dentist/LabDetailsPage/view/LabDetailsPageWidgets/lab_case_with_doctor_item.dart';
import 'package:template/core/widgets/app_spacing.dart';

import '../../../../core/utils/static.dart';

class LabCaseWithDoctorList extends StatelessWidget {
  final LabController controller;

  const LabCaseWithDoctorList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.caseDetails.value?.orders?.isEmpty ?? true
          ? const Center(
              child: Text('لا توجد حالات متاحة'),
            )
          : ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: Static.getwidth(context, 24),
                vertical: Static.getheight(context, 16),
              ),
              itemCount: controller.caseDetails.value?.orders?.length ?? 0,
              separatorBuilder: (context, index) =>
                  AppSpacing.height(context, 10),
              itemBuilder: (context, index) {
                final order = controller.caseDetails.value?.orders?[index];
                return LabCaseWithDoctorItem(
                  order: order,
                );
              },
            );
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: Static.getwidth(context, 24),
          vertical: Static.getheight(context, 16),
        ),
        itemCount: controller.caseDetails.value?.orders?.length ?? 0,
        separatorBuilder: (context, index) => AppSpacing.height(context, 10),
        itemBuilder: (context, index) {
          final order = controller.caseDetails.value?.orders?[index];
          return LabCaseWithDoctorItem(
            order: order,
          );
        },
      );
    });
  }
}
