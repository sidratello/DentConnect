
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/lab/features/order/views/order_wedjet/tab_item.dart';
import '../../controller/order_controller.dart';

class LabOrderTabsWidget extends StatelessWidget {
  const LabOrderTabsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LabOrderController>();

    return Obx(
      () => Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TabItem(
              title: 'الكل',
              isSelected:
                  controller.selectedFilter.value == OrderFilter.all,
              onTap: () => controller.applyFilter(OrderFilter.all),
            ),
            TabItem(
              title: 'مستعجلة',
              isSelected:
                  controller.selectedFilter.value == OrderFilter.urgent,
              onTap: () => controller.applyFilter(OrderFilter.urgent),
            ),
            TabItem(
              title: 'غير مستعجلة',
              isSelected:
                  controller.selectedFilter.value == OrderFilter.notUrgent,
              onTap: () => controller.applyFilter(OrderFilter.notUrgent),
            ),
          ],
        ),
      ),
    );
  }
}
