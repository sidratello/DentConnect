import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/widgets/app_button.dart';
import 'package:template/lab/features/update_order_satatus/views/wedjet/order_status_timeline.dart';
import 'package:template/lab/features/update_order_satatus/views/wedjet/status_dropdown_card.dart';
import 'package:template/lab/features/update_order_satatus/views/wedjet/status_image_picker_card.dart';
import 'package:template/lab/features/update_order_satatus/views/wedjet/status_notes_card.dart';
import 'package:template/lab/features/update_order_satatus/views/wedjet/update_order_status_header.dart';
import '../../controller/update_order_status_controller.dart';


class UpdateOrderStatusBody extends StatelessWidget {
  const UpdateOrderStatusBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UpdateOrderStatusController>();

    return ListView(
      padding: const EdgeInsets.fromLTRB(22, 12, 22, 30),
      children: [
         const UpdateOrderStatusHeader(),
        const SizedBox(height: 12),

        const OrderStatusTimeline(),
        const SizedBox(height: 16),
        const StatusDropdownCard(),
        const SizedBox(height: 16),

        const StatusImagePickerCard(),
        const SizedBox(height: 16),

        const StatusNotesCard(),
        const SizedBox(height: 22),

        Obx(() {
          return AppButton(
            title: 'حفظ التحديث',
            type: AppButtonType.gradient,
            height: 56,
            isLoading: controller.isLoading.value,
            icon: const Icon(
              Icons.check_rounded,
              color: Colors.white,
            ),
            onTap: controller.updateStatus,
          );
        }),
      ],
    );
  }
}