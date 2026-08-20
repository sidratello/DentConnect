import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/lab/features/order/views/order_wedjet/tab_item.dart';
import '../../controller/order_controller.dart';

class LabOrderTabsWidget extends StatelessWidget {
  const LabOrderTabsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LabOrderController>();

    return  Obx(
  () => Directionality(
    textDirection: TextDirection.rtl,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        children: [
          TabItem(
            title: 'الكل',
            icon: Icons.grid_view_rounded,
            iconColor: AppColors.primaryBlue,
            isSelected: controller.selectedFilter.value == OrderFilter.all,
            onTap: () => controller.applyFilter(OrderFilter.all),
          ),
          const SizedBox(width: 10),
          TabItem(
            title: 'مستعجلة',
            icon: Icons.notifications_none_rounded,
            iconColor: AppColors.red,
            isSelected: controller.selectedFilter.value == OrderFilter.urgent,
            onTap: () => controller.applyFilter(OrderFilter.urgent),
          ),
          const SizedBox(width: 10),
          TabItem(
            title: 'غير مستعجلة',
            icon: Icons.schedule_rounded,
            iconColor: AppColors.primaryBlue,
            isSelected:
                controller.selectedFilter.value == OrderFilter.notUrgent,
            onTap: () => controller.applyFilter(OrderFilter.notUrgent),
          ),
        ],
      ),
    ),
  ),
);
  }
}