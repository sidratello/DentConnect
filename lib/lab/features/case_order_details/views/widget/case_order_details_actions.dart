import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_router.dart';
import 'package:template/core/widgets/app_button.dart';
import 'package:template/lab/features/case_order_details/controller/case_order_details_controller.dart';

class CaseOrderDetailsActions extends StatelessWidget {
  const CaseOrderDetailsActions({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CaseOrderDetailsController>();

    return Obx(() {
      final order = controller.order.value;

      if (order == null || order.status == 'Cancelled') {
        return const SizedBox.shrink();
      }

      return Container(
        padding: const EdgeInsets.fromLTRB(22, 12, 22, 22),
        child: AppButton(
          title: 'تحديث حالة الطلب',
          type: AppButtonType.gradient,
          height: 56,
          borderRadius: 14,
          icon: const Icon(
            Icons.sync_rounded,
            color: Colors.white,
            size: 24,
          ),
    onTap: controller.openUpdateOrderStatus,
        ),
      );
    });
  }
}