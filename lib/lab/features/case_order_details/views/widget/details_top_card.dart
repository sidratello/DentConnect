import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_helper.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/case_orders/views/widget/InfoRow.dart';
import 'package:template/lab/features/case_orders/views/widget/OrderImage.dart';
import 'package:template/lab/shared/models/lab_order_model.dart';

class DetailsTopCard extends StatelessWidget {
  final LabOrderModel order;
  final String date;

  const DetailsTopCard({
    super.key,
    required this.order,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            OrderImage(
  imagePath: order.displayImage,
  width: double.infinity,
  height: 190,
  borderRadius: BorderRadius.circular(18),
),
            Positioned(
              right: 10,
              bottom: 10,
              child: _ImageBadge(),
            ),
          ],
        ),

        const SizedBox(height: 16),

        Row(
          textDirection: TextDirection.rtl,
          children: [
            Expanded(
              child: Text(
                order.title,
                textAlign: TextAlign.right,
                style: AppTextStyles.ibmBold22NeutralStyle.copyWith(
                  color: AppColors.darkBlue,
                ),
              ),
            ),

            const SizedBox(width: 12),

           CaseOrderIconText(
  isChip: true,
  text: AppHelper.getArabicTitle(order.status),
  icon: AppHelper.getIcon(order.status),
  iconColor: AppHelper.getColor(order.status),
  textColor: AppHelper.getColor(order.status),
  background: AppHelper.getLightColor(order.status),
),
 const SizedBox(width: 13),
          ],
        ),

        const SizedBox(height: 12),

        Row(
          textDirection: TextDirection.rtl,
          children: [
          
           
                      Expanded(
              
  child: CaseOrderIconText(
    icon: Icons.calendar_month_outlined,
    text: 'تاريخ التسليم: $date',
    iconColor: AppColors.primaryBlue,
    textColor: AppColors.normalText,
    expandText: false,
  ),
),
Container(
  width: 2,
  height: 24,
  margin: const EdgeInsets.symmetric(horizontal: 12),
  color: AppColors.littleBlue.withOpacity(.7),
),

 CaseOrderIconText(
        icon: order.isUrgent
            ? Icons.local_fire_department_rounded
            : Icons.schedule_rounded,
        text: order.isUrgent
            ? 'مستعجلة'
            : 'غير مستعجلة',
        iconColor: order.isUrgent
            ? AppColors.urgentText
            : AppColors.normalText,
        textColor: order.isUrgent
            ? AppColors.urgentText
            : AppColors.normalText,
        expandText: false,
      
    ),
          ],
        ),

    
      ],
    );
  }





}

class _ImageBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(.92),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.littleBlue.withOpacity(.8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.image_outlined,
            color: AppColors.primaryBlue,
            size: 18,
          ),
          const SizedBox(width: 5),
          Text(
            'صورة الطلب',
            style: AppTextStyles.ibmRegular12DarkStyle.copyWith(
              color: AppColors.primaryBlue,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

