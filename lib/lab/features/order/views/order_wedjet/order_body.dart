



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_router.dart';
import 'package:template/lab/features/homepage/controller/homecontroller.dart';
import 'package:template/lab/features/order/views/order_wedjet/order_card.dart';
import '../../controller/order_controller.dart';


class LabOrderBodyWidget extends StatelessWidget {
  const LabOrderBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LabOrderController>();

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.orders.isEmpty) {
        return const Center(
          child: Text('لا توجد طلبات'),
        );
      }

      return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemCount: controller.orders.length,
        separatorBuilder: (_, __) => const SizedBox(height: 14),
        itemBuilder: (context, index) {
          return  GestureDetector(
  onTap: ()async {
      final result =await Get.toNamed(
      AppRouter.orderDetails,
      arguments: controller.orders[index],
    );
if (result is Map && result['success'] == true) {
  await controller.getOrders();
  if (Get.isRegistered<LabHomeController>()) {
    Get.find<LabHomeController>().getPendingOrdersCount();
  }
  Get.snackbar(
    'تم',
    result['message'] ?? 'تم تحديث الطلب',
  );
}
  },
  child: LabOrderCardWidget(
    order: controller.orders[index],
  ),
);
        },
      );
    });
  }
}