import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/Dentist/CasesPage/view/CasePageWidgets/case_footer_builder.dart';
import 'package:template/Dentist/CasesPage/view/CasePageWidgets/case_details_page.dart';
import 'package:template/Dentist/CreateOrderPage/view/CreateOrderWidgets/Teeth/teeth_selector.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_case_card.dart';

import '../../model/case_model.dart';
import '../../model/case_status.dart';

import 'case_status_badge.dart';

class CaseCardItem extends StatelessWidget {
  final CaseItem item;

  const CaseCardItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final CaseStatus status = CaseStatus.getStatusFromString(
      item.status,
    );

    final bool canEdit = status == CaseStatus.waitingApproval ||
        status == CaseStatus.needInfo ||
        status == CaseStatus.waitingForClarification;
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Get.to(
              () => CaseDetailsForDoctorPage(
                item: item,
              ),
            );
          },
          child: AppCaseCard(
            imagePath: 'assets/images/case_image.png',
            title: item.title ?? 'بدون عنوان',
            description: item.notes ?? 'لا توجد ملاحظات',
            bottomWidget: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CaseFooterBuilder(
                  item: item,
                ),
                CaseStatusBadge(
                  status: CaseStatus.getStatusFromString(
                    item.status,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (canEdit) ...[
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: .06),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: .12),
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: () {
                  if (item.id == null) {
                    Get.snackbar(
                      'خطأ',
                      'معرف الطلب غير موجود',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                    return;
                  }

                  Get.to(
                    () => TeethSelector(
                      isEditMode: true,
                      orderId: item.id!,
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit_outlined,
                      size: 18,
                      color: AppColors.primary.withValues(
                        alpha: .85,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'تعديل الطلبية',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary.withValues(
                          alpha: .9,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
