import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/CaseDetailsPage/model/case_details_model.dart';
import 'package:template/Dentist/CaseDetailsPage/view/case_details_page.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/static.dart';
import '../../../../core/widgets/app_case_card.dart';

class LabCaseWithDoctorItem extends StatelessWidget {
  final Orders? order;

  const LabCaseWithDoctorItem({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => CaseDetailsPage(orders: order),
        );
      },
      child: AppCaseCard(
        imagePath: 'assets/images/case_image.png',
        title: order?.title ?? 'يكتب هنا اسم الحالة',
        description: order?.notes ?? 'يكتب هنا وصف الحالة',
        bottomWidget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'السعر: ${order?.finalPrice ?? order?.estimatedPrice ?? 0}\$',
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
                  'الحالة:',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w500,
                    fontSize: Static.getwidth(context, 14),
                  ),
                ),
                SizedBox(
                  width: Static.getwidth(context, 6),
                ),
                Text(
                  order?.status ?? '',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w400,
                    fontSize: Static.getwidth(context, 14),
                    color: AppColors.textSecondary,
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
