import 'package:flutter/material.dart';
import 'package:template/Dentist/CasesPage/view/CasePageWidgets/case_footer_builder.dart';

import '../../../../core/widgets/app_case_card.dart';
import '../../model/case_model.dart';
import '../../model/case_status.dart';
import 'additional_info_sheet.dart';
import 'case_status_badge.dart';
import 'rating_sheet.dart';

class CaseCardItem extends StatelessWidget {
  final CaseModel item;

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
            }

            if (item.status == CaseStatus.delivered && !item.isRated) {
              showRatingSheet();
            }
          },
          child: AppCaseCard(
            imagePath: item.imagePath,
            title: item.compensationName,
            description: item.compensationDescription,
            topWidget: CaseStatusBadge(
              status: item.status,
            ),
            bottomWidget: CaseFooterBuilder(
              item: item,
            ),
          ),
        ),
      ],
    );
  }
}
