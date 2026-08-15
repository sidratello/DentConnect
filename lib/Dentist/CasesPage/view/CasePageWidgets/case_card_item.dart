import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/CaseDetailsPage/model/case_details_model.dart';
import 'package:template/Dentist/CasesPage/view/CasePageWidgets/case_footer_builder.dart';
import 'package:template/Dentist/CasesPage/view/CasePageWidgets/case_details_page.dart';

import '../../../../core/widgets/app_case_card.dart';
import '../../model/case_model.dart';
import '../../model/case_status.dart';
import 'additional_info_sheet.dart';
import 'case_status_badge.dart';

class CaseCardItem extends StatelessWidget {
  final CaseItem item;

  const CaseCardItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            if (item.status == CaseStatus.needInfo) {
              showAdditionalInfoSheet();
            } else {
              Get.to(
                () => CaseDetailsForDoctorPage(item: item),
              );
            }
          },
          child: AppCaseCard(
            imagePath: item.files != null && item.files!.isNotEmpty
                ? item.files![0]
                : 'assets/images/case_image.png',
            title: item.title ?? 'بدون عنوان',
            description: item.notes ?? 'لا توجد ملاحظات',
            bottomWidget: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CaseFooterBuilder(
                  item: item,
                ),
                CaseStatusBadge(
                  status: CaseStatus.getStatusFromString(item.status),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
