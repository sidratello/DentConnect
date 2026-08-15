import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/LabDetailsPage/controller/lab_controller.dart';
import 'package:template/Dentist/LabDetailsPage/view/LabDetailsPageWidgets/materials_bottom_sheet.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/static.dart';

class LabMaterialsAndSpecializations extends StatelessWidget {
  const LabMaterialsAndSpecializations({super.key});

  @override
  Widget build(BuildContext context) {
    LabController controller = Get.find<LabController>();

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Static.getwidth(context, 16),
        ),
        child: InkWell(
          onTap: () {
            showLabInfoBottomSheet(
              context,
              specialties: controller.labModel?.specialties ?? [],
              materials: controller.labModel?.materials ?? [],
            );
          },
          child: Text(
            'أنواع المواد المستخدمة واختصاصات المخبر',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w500,
                fontSize: Static.getwidth(context, 18),
                decoration: TextDecoration.underline,
                color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
