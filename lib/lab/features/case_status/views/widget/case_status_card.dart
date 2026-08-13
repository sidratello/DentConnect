import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_router.dart';
import 'package:template/core/app_text_styles.dart';
import '../../controller/case_status_controller.dart';
import '../../model/case_status_model.dart';

class CaseStatusCard extends StatelessWidget {
  final CaseStatusModel status;

  const CaseStatusCard({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CaseStatusController>();

final color = controller.getColor(status.status);
final lightColor = controller.getLightColor(status.status);

    return Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(18),
    onTap: () {
  controller.openStatusOrders(
    status,
  );
},
      child:
    Container(
      height: 86,
      margin: const EdgeInsets.only(bottom: 13),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.littleBlue.withOpacity(0.32),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkBlue.withOpacity(0.055),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: lightColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              controller.getIcon(status.status),
              color: color,
              size: 31,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                controller.getArabicTitle(status.status),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                    color: AppColors.darkBlue,
                    fontWeight: FontWeight.bold,
                    
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                 controller.getSubtitle(status.status),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                    color: AppColors.normalText,
                fontWeight: FontWeight.w100,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          Container(
            width: 62,
            height: 58,
            decoration: BoxDecoration(
              color: lightColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${status.count}',
                  style: AppTextStyles.ibmBold22NeutralStyle.copyWith(
                    color: color,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'طلب',
                  style: AppTextStyles.ibmRegular12DarkStyle.copyWith(
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          Directionality(
              textDirection: TextDirection.ltr,
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.normalText.withOpacity(0.45),
              size: 18,
            ),
          ),
        ],
      ),
    ),
    ),
    );
  }
}