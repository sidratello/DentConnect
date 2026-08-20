 import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_helper.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/case_orders/views/widget/InfoRow.dart';
import 'package:template/lab/features/case_orders/views/widget/OrderImage.dart';
import 'package:template/lab/shared/models/lab_order_model.dart';

class CaseOrdersCard extends StatelessWidget {
  final LabOrderModel order;
   final bool showPaidStatus;
  final Widget? statusWidget;
  final VoidCallback? onTap;
  final Widget? bottomWidget;
  const CaseOrdersCard({
    super.key,
    required this.order,
       this.statusWidget,
     required this.showPaidStatus,
     this.onTap,
    this.bottomWidget,
  });

  @override
  Widget build(BuildContext context) {
    final imagePath = order.displayImage;

    return InkWell(
           borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(22),
        border: Border.all(
      color: AppColors.primaryBlue, // Blue border
      width: 1,                     // Border thickness
        ),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkBlue.withOpacity(.06),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          children:[
             Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
          order.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.right,
          style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
            color: AppColors.darkBlue,
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
              ),
          
              const SizedBox(height: 10),
          
              Row(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OrderImage(
              imagePath: imagePath,
            
            ),
          
            const SizedBox(width: 14),
          
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CaseOrderIconText(
                    icon: Icons.person_outline_rounded,
                    text: 'د. ${order.dentistName}',
                    iconColor: AppColors.primaryBlue,
                    textColor: AppColors.darkBlue,
                  ),
          
                  const SizedBox(height: 7),
          
                  CaseOrderIconText(
                    icon: Icons.calendar_month_outlined,
                    text: _formatDate(order.deliveryDate),
                    iconColor: AppColors.primaryBlue,
                    textColor: AppColors.darkBlue,
                  ),
          
                  const SizedBox(height: 7),
          
      CaseOrderIconText(
        imagePath: order.impressionType == 'Digital'
        ? 'assets/images/scanner.png'
        : 'assets/images/teeth (1).png',
        text: AppHelper.arabicImpressionType(order.impressionType),
        iconColor: AppColors.primaryBlue,
        textColor: AppColors.darkBlue,
      ),
          
                  const SizedBox(height: 12),
          
             
                   
             
if (bottomWidget != null)
  bottomWidget!
else if (statusWidget != null)

  statusWidget!


else if (showPaidStatus)
  CaseOrderIconText(
    isChip: true,
    text: order.isPaid ? 'مدفوعة' : 'غير مدفوعة',
    icon: order.isPaid
        ? Icons.check_circle_outline_rounded
        : Icons.attach_money,
    iconColor: order.isPaid ? AppColors.green : AppColors.red,
    textColor: order.isPaid ? AppColors.green : AppColors.red,
    background: order.isPaid
        ? AppColors.green.withOpacity(.10)
        : AppColors.red.withOpacity(.10),
  ),
                    
                    
                  
                ],
              ),
            ),
          
            const SizedBox(width: 10),
          
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.littleBlue.withOpacity(.45),
                shape: BoxShape.circle,
              ),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.darkBlue,
                  size: 15,
                ),
              ),
            ),
          ],
              ),
       
        ],
      ),
                     Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: order.isUrgent
                    ? AppColors.urgentBackground
                    : AppColors.grey200,
                borderRadius: BorderRadius.circular(18),
              ),
              child:CaseOrderIconText(
                expandText: false,
        icon: order.isUrgent
        ? Icons.local_fire_department_rounded
        : Icons.schedule_rounded,
        text: order.isUrgent ? 'مستعجلة' : 'غير مستعجلة',
        iconColor: order.isUrgent
        ? AppColors.urgentText
        : AppColors.normalText,
        textColor: order.isUrgent
        ? AppColors.urgentText
        : AppColors.normalText,
      ),
            ),
          ),
            ],
          ),
          
        
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '-';
    return '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}';
  }


}
