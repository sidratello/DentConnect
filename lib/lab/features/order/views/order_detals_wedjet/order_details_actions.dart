import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_helper.dart';
import 'package:template/core/widgets/app_button.dart';
import 'package:template/core/widgets/custom_action_dialog.dart';
import 'package:template/lab/features/case_order_details/views/widget/details_section_card.dart';
import 'package:template/lab/features/order/controller/order_details_controller.dart';

class OrderDetailsActionsWidget extends StatelessWidget {
  const OrderDetailsActionsWidget({super.key});

  void _showRejectDialog(
    BuildContext context,
    OrderDetailsController controller,
  ) {
    final reasonController = TextEditingController();

    CustomActionDialog.show(
      context: context,
      title: 'سبب رفض الطلب',
      content: TextField(
        controller: reasonController,
        maxLines: 4,
        textAlign: TextAlign.right,
        decoration: const InputDecoration(
          hintText: 'اكتب سبب الرفض',
          border: OutlineInputBorder(),
        ),
      ),
      confirmButton: Obx(
        () => AppButton(
          title: 'رفض',
          onTap: () {
            controller.rejectOrder(reasonController.text);
          },
          width: 110,
          height: 44,
          borderRadius: 14,
          backgroundColor: const Color.fromARGB(255, 206, 74, 74),
          isLoading: controller.isRejectLoading.value,
        ),
      ),
    );
  }

  void _showRequestInfoDialog(
    BuildContext context,
    OrderDetailsController controller,
  ) {
    final messageController = TextEditingController();

    CustomActionDialog.show(
      context: context,
      title: 'طلب معلومات إضافية',
      content: TextField(
        controller: messageController,
        maxLines: 4,
        textAlign: TextAlign.right,
        decoration: const InputDecoration(
          hintText: 'قم بكتابة ما تريد طلبه من معلومات إضافية',
          border: OutlineInputBorder(),
        ),
      ),
      confirmButton: Obx(
        () => AppButton(
          title: 'إرسال',
          onTap: () {
            controller.requestMoreInfo(messageController.text);
          },
          width: 110,
          height: 44,
          borderRadius: 14,
          backgroundColor: AppColors.primaryBlue,
          isLoading: controller.isRequestInfoLoading.value,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OrderDetailsController>();

    return  DetailsSectionCard(
padding: const EdgeInsets.fromLTRB(14, 12, 14, 18),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => AppButton(
              title: 'قبول الطلب',
              type: AppButtonType.customDecoration,
              decoration: AppHelper.acceptButtonDecoration(14),
              height: 58,
              borderRadius: 14,
              isLoading: controller.isAcceptLoading.value,
              icon: const Icon(
                Icons.check_circle_outline_rounded,
                color: AppColors.white,
                size: 24,
              ),
              onTap: controller.acceptOrder,
            ),
          ),

          const SizedBox(height: 12),
Row(
  children: [
    Expanded(
      flex: 2,
      child: AppButton(
        title: ' طلب معلومات إضافية ',
        type: AppButtonType.outlined,
        height: 54,
        borderRadius: 14,
        borderColor: AppColors.primaryBlue,
        textColor: AppColors.primaryBlue,
        padding: const EdgeInsets.symmetric(horizontal: 6),
        icon: const Icon(
          Icons.help_outline_rounded,
          color: AppColors.primaryBlue,
          size: 20,
        ),
        onTap: () {
          _showRequestInfoDialog(context, controller);
        },
      ),
    ),

    const SizedBox(width: 10),

    Expanded(
      flex: 1,
      child: AppButton(
        title: 'رفض',
        type: AppButtonType.outlined,
        height: 54,
        borderRadius: 14,
        borderColor: AppColors.red,
        textColor: AppColors.red,
        padding: const EdgeInsets.symmetric(horizontal: 6),
        icon: const Icon(
          Icons.cancel_outlined,
          color: AppColors.red,
          size: 20,
        ),
        onTap: () {
          _showRejectDialog(context, controller);
        },
      ),
    ),
  ],
),
        ],
      ),
    );
  }
}