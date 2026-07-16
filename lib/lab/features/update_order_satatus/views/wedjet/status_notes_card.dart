import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_helper.dart';
import 'package:template/core/app_text_styles.dart';
import '../../controller/update_order_status_controller.dart';

class StatusNotesCard extends StatelessWidget {
  const StatusNotesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UpdateOrderStatusController>();

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: AppHelper.whiteCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ملاحظات (اختياري)',
            style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
              color: AppColors.darkBlue,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: controller.notesController,
            maxLines: 4,
            maxLength: 300,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: 'اكتب ملاحظاتك هنا...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}