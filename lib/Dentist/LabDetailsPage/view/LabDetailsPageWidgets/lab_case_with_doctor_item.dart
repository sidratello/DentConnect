import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/CaseDetailsPage/view/case_details_dummy.dart';
import 'package:template/Dentist/CaseDetailsPage/view/case_details_page.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/static.dart';
import '../../../../core/widgets/app_case_card.dart';

class LabCaseWithDoctorItem extends StatelessWidget {
  const LabCaseWithDoctorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => const CaseDetailsPage(
            details: dummyCaseDetails,
          ),
        );
      },
      child: AppCaseCard(
        imagePath: 'assets/images/case_image.png',
        title: 'طبعة عادية',
        description:
            'وصف مختصر عن الحالة السنية التي تم تنفيذها داخل المخبر بشكل احترافي ومميز...',
        bottomWidget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'السعر: 60\$',
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w400,
                fontSize: Static.getwidth(context, 14),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Row(
              children: [
                Text(
                  'تقييم الحالة :',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w500,
                    fontSize: Static.getwidth(context, 14),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: Static.getwidth(context, 4),
                  ),
                  child: Text(
                    '4.5',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontWeight: FontWeight.w400,
                      fontSize: Static.getwidth(context, 14),
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: Static.getwidth(context, 4),
                  ),
                  child: Icon(
                    Icons.star_rounded,
                    color: AppColors.yellowRate,
                    size: Static.getwidth(context, 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
