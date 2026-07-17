import 'package:flutter/material.dart';
import 'package:template/Dentist/LabDetailsPage/view/LabDetailsPageWidgets/lab_case_with_doctor_item.dart';
import 'package:template/core/widgets/app_spacing.dart';

import '../../../../core/utils/static.dart';

class LabCaseWithDoctorList extends StatelessWidget {
  const LabCaseWithDoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: Static.getwidth(context, 24),
        vertical: Static.getheight(context, 16),
      ),
      itemBuilder: (context, index) => const LabCaseWithDoctorItem(),
      itemCount: 5,
      separatorBuilder: (context, index) => AppSpacing.height(context, 10),
    );
  }
}
