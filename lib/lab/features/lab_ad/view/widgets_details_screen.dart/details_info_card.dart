import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/case_orders/views/widget/InfoRow.dart';
import 'package:template/lab/features/lab_ad/view/wedjet_lab_ad/lab_ad_status_chip.dart';


class LabAdDetailsInfoCard
    extends StatelessWidget {
  final bool isActive;
  final bool isPaid;

  final String price;
  final String createdAt;
  final String expiresAt;

  const LabAdDetailsInfoCard({
    super.key,
    required this.isActive,
    required this.isPaid,
    required this.price,
    required this.createdAt,
    required this.expiresAt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius:
            BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.littleBlue
              .withOpacity(.7),
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch,
        children: [
          Text(
            'معلومات الإعلان',
            textAlign: TextAlign.right,
            style: AppTextStyles
                .ibmRegular14NeutralStyle
                .copyWith(
              color:
                  AppColors.darkBlue,
              fontWeight:
                  FontWeight.w800,
            ),
          ),

          const SizedBox(height: 16),

          _InfoItem(
            title: 'الحالة',
            child: Align(
              alignment:
                  Alignment.centerRight,
              child: 
    LabAdStatusChip(
  isActive: isActive,
  isPaid: isPaid,
),
            ),
          ),

          const _Divider(),

          _InfoItem(
            title: 'حالة الدفع',
            child: CaseOrderIconText(
              icon: isPaid
                  ? Icons
                      .check_circle_outline_rounded
                  : Icons
                      .payments_outlined,
              text: isPaid
                  ? 'تم الدفع'
                  : 'غير مدفوع',
              iconColor: isPaid
                  ? AppColors.green
                  : AppColors.urgentText,
              textColor: isPaid
                  ? AppColors.green
                  : AppColors.urgentText,
              expandText: false,
            ),
          ),

          const _Divider(),

          _InfoItem(
            title: 'رسوم الإعلان',
            child: CaseOrderIconText(
              icon:
                  Icons.payments_outlined,
              text: '$price ل.س',
              iconColor:
                  AppColors.primaryBlue,
              textColor:
                  AppColors.darkBlue,
              expandText: false,
            ),
          ),

          const _Divider(),

          _InfoItem(
            title: 'تاريخ الإنشاء',
            child: CaseOrderIconText(
              icon:
                  Icons.calendar_today_outlined,
              text: createdAt,
              iconColor:
                  AppColors.primaryBlue,
              textColor:
                  AppColors.normalText,
              expandText: false,
            ),
          ),

          const _Divider(),

          _InfoItem(
            title: 'تاريخ الانتهاء',
            child: CaseOrderIconText(
              icon:
                  Icons.event_busy_outlined,
              text: expiresAt,
              iconColor:
                  AppColors.primaryBlue,
              textColor:
                  AppColors.normalText,
              expandText: false,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoItem
    extends StatelessWidget {
  final String title;
  final Widget child;

  const _InfoItem({
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection:
          TextDirection.rtl,
      crossAxisAlignment:
          CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            title,
            textAlign:
                TextAlign.right,
            style: AppTextStyles
                .ibmRegular14NeutralStyle
                .copyWith(
              color:
                  AppColors.normalText,
              fontWeight:
                  FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 14),
        Flexible(
          child: child,
        ),
      ],
    );
  }
}

class _Divider
    extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(
        vertical: 13,
      ),
      child: Divider(
        height: 1,
        color: AppColors.littleBlue
            .withOpacity(.55),
      ),
    );
  }
}