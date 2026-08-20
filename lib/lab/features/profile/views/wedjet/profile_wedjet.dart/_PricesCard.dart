import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/profile/model/profile_modil.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/section_card.dart';
import 'package:template/lab/features/profile/views/wedjet/profile_wedjet.dart/text_for_table.dart';

class PricesCard extends StatelessWidget {
  final LabProfileModel profile;

  const PricesCard({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final prices = profile.prices;

    return ProfileSectionCard(
      title: 'قائمة الأسعار والتعويضات',
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (prices.isEmpty)
          Text(
            'لا توجد أسعار',
            style: AppTextStyles.ibmRegular14NeutralStyle,
          )
        else ...[
          _HeaderRow(),
          SizedBox(height: 8.h),

          ...prices.map((item) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.primaryBlue.withOpacity(.15),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      item.compensationType,
                      textAlign: TextAlign.right,
                      style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: Text(
                      '${item.unitPrice}',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 4,
                    child: Text(
                      item.notes?.isNotEmpty == true ? item.notes! : '-',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ],
    );
  }
}

class _HeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          HeaderText(text: 'نوع التعويض', flex: 3),
          HeaderText(text: 'السعر', flex: 2),
          HeaderText(text: 'الملاحظات', flex: 4),
        ],
      ),
    );
  }
}
