import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/app_button.dart';
import 'package:template/core/widgets/custom_action_dialog.dart';

import '../../controller/scan_slots_controller.dart';
import '../../model/scan_slot_model.dart';

class DeleteScanSlotDialog {
  const DeleteScanSlotDialog._();

  static void show({
    required BuildContext context,
    required ScanSlotModel slot,
    required ScanSlotsController controller,
  }) {
    if (slot.isBooked) {
      Get.snackbar(
        'غير متاح',
        'لا يمكن حذف موعد محجوز',
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

    final time = _extractTime(
      slot.timeFormatted,
    );

    final period =
        slot.period.toUpperCase();

    CustomActionDialog.show(
      context: context,
      title: 'حذف موعد المسح',
      barrierDismissible: false,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: AppColors.lightRed.withOpacity(
                0.10,
              ),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.delete_outline_rounded,
              color: AppColors.lightRed,
              size: 29,
            ),
          ),

          const SizedBox(height: 14),

          Text(
            'هل أنت متأكد من حذف هذا الموعد؟',
            textAlign: TextAlign.center,
            style: AppTextStyles
                .ibmMedium18NeutralStyle
                .copyWith(
              color: AppColors.darkBlue,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            'الموعد: $time $period',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: AppTextStyles
                .ibmRegular14NeutralStyle
                .copyWith(
              color: AppColors.normalText,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            'لا يمكن التراجع عن عملية الحذف.',
            textAlign: TextAlign.center,
            style: AppTextStyles
                .ibmRegular14NeutralStyle
                .copyWith(
              color: AppColors.lightRed,
              fontSize: 12,
            ),
          ),
        ],
      ),
      confirmButton: Obx(
        () {
          final isDeleting =
              controller.isDeleting.value;

          return SizedBox(
            width: 105,
            child: AppButton(
              title: 'حذف',
              type: AppButtonType.filled,
              height: 42,
              borderRadius: 10,
              backgroundColor:
                  AppColors.lightRed,
              textColor: AppColors.white,
              isLoading: isDeleting,
              enabled: !isDeleting,
              padding: EdgeInsets.zero,
              textStyle: AppTextStyles
                  .ibmRegular14NeutralStyle
                  .copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
              onTap: isDeleting
                  ? null
                  : () {
                      controller.deleteSlot(
                        slot,
                      );
                    },
            ),
          );
        },
      ),
    );
  }

  static String _extractTime(
    String value,
  ) {
    final match = RegExp(
      r'\d{1,2}:\d{2}',
    ).firstMatch(value);

    return match?.group(0) ?? value;
  }
}