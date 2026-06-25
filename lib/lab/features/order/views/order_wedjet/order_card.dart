import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/order/views/order_wedjet/order_arabic_text_healper.dart';

import '../../model/order_model.dart';

class LabOrderCardWidget extends StatelessWidget {
  final LabOrderModel order;

  const LabOrderCardWidget({
    super.key,
    required this.order,
  });


  @override
  Widget build(BuildContext context) {
    final date = DateFormat('yyyy-MM-dd').format(order.deliveryDate);

    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: AppColors.darkBlue,
            width: 1.5,
          ),
          image: const DecorationImage(
            image: AssetImage(
              'assets/images/557f03b1-0116-4d2a-90e8-cd363dc895c6.png',
            ),
            fit: BoxFit.none,
            opacity: 0.18,
            alignment: Alignment.center,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.12),
              blurRadius: 12,
              offset: const Offset(3, 15),
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 6,
                decoration: BoxDecoration(
                  color: order.isUrgent ? AppColors.red : AppColors.darkBlue,
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(18),
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Right side info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        order.title,
                                        textAlign: TextAlign.right,
                                        style: AppTextStyles.ibmBold22NeutralStyle.copyWith(
                                          fontSize: 20,
                                          color: AppColors.neutral1000,
                                        ),
                                      ),
                                    ),
                                    // if (order.isUrgent)
                                    //   _StatusChip(
                                    //     title: 'مستعجلة',
                                    //     icon: Icons.timer_outlined,
                                    //     backgroundColor: AppColors.lightRed,
                                    //     textColor: AppColors.white,
                                    //   ),
                                  ],
                                ),

                                const SizedBox(height: 10),

                                Text(
                                  'د. ${order.dentistName}',
                                  textAlign: TextAlign.right,
                                  style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                Text(
                                  order.dentistClinicAddress,
                                  textAlign: TextAlign.right,
                                  style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
                                    fontSize: 16,
                                    color: AppColors.textDark,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 10),

                          /// Left side chips as column
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _InfoChip(
                                title: OrderTextHelper.arabicImpressionType(order.impressionType),
                                icon: Icons.medical_services_outlined,
                                backgroundColor: AppColors.lightCyan,
                                textColor: AppColors.darkBlue,
                              ),

                              const SizedBox(height: 12),

                              _InfoChip(
                                title: OrderTextHelper.arabicImpressionStage(order.impressionStage),
                                icon: Icons.workspace_premium_outlined,
                                backgroundColor: AppColors.darkBlue,
                                textColor: AppColors.white,
                              ),
                              const SizedBox(height: 12),

_InfoChip(
  title: order.isUrgent
      ? 'مستعجل'
      : 'غير مستعجل',
  icon: Icons.schedule,
  backgroundColor: order.isUrgent
      ? AppColors.grey
      : AppColors.grey,
  textColor: order.isUrgent
      ? AppColors.grey600
      : AppColors.grey600,
       textPadding: const EdgeInsets.only(left: 5),
),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 14),

                      Row(
                        textDirection: ui.TextDirection.ltr,
                        children: [
                          Text(
                            date,
                            style: AppTextStyles.ibmMedium18NeutralStyle,
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.calendar_month_rounded,
                            color: Colors.grey,
                          ),
                          const Spacer(),
                          Text(
                            'تاريخ التسليم:',
                            style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                              color: AppColors.textDark,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class _InfoChip extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
final EdgeInsetsGeometry? textPadding;
  const _InfoChip({
    required this.title,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    this.textPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 18,
            color: textColor,
          ),
          const SizedBox(width: 5),
          Padding(
           padding: textPadding ?? EdgeInsets.zero,
            child: Text(
              title,
              style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                color: textColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
