import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_helper.dart';
import 'package:template/core/app_text_styles.dart';
import '../../controller/update_order_status_controller.dart';

class StatusDropdownCard extends StatelessWidget {
  const StatusDropdownCard({super.key});

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
            'الحالة الجديدة *',
            style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
              color: AppColors.darkBlue,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          Obx(() {
            return DropdownButtonFormField<int>(
              value: controller.selectedStatus.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items: controller.statuses.map((item) {
                return DropdownMenuItem<int>(
                  value: item['id'] as int,
                  child: Text(item['title'].toString()),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  controller.selectedStatus.value = value;
                }
              },
            );
          }),
        ],
      ),
    );
  }


}