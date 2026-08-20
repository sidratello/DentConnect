import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/app_button.dart';
import 'package:template/lab/features/add_scan_slot/controller/scan_slot_form_controller.dart';


class ScanPeriodSelector extends StatelessWidget {
    final ScanSlotFormController controller;
  const ScanPeriodSelector({super.key,    required this.controller,});

  @override
  Widget build(BuildContext context) {


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'الفترة',
          style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
            color: AppColors.darkBlue,
            fontWeight: FontWeight.w800,
          ),
        ),

        const SizedBox(height: 9),

        Obx(() {
          final isAmSelected =
              controller.selectedPeriod.value == 'AM';

          final isPmSelected =
              controller.selectedPeriod.value == 'PM';

          return Row(
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                child: AppButton(
                  title: 'صباحاً (AM)',
                  type: isAmSelected
                      ? AppButtonType.filled
                      : AppButtonType.outlined,
                  height: 48,
                  borderRadius: 13,
                  backgroundColor: isAmSelected
                      ? AppColors.primaryBlue
                      : AppColors.white,
                  borderColor: isAmSelected
                      ? AppColors.primaryBlue
                      : AppColors.littleBlue,
                  textColor: isAmSelected
                      ? AppColors.white
                      : AppColors.darkBlue,
                  textStyle:
                      AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                    color: isAmSelected
                        ? AppColors.white
                        : AppColors.darkBlue,
                    fontWeight: FontWeight.w700,
                  ),
                  onTap: () {
                    controller.changePeriod('AM');
                  },
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: AppButton(
                  title: 'مساءً (PM)',
                  type: isPmSelected
                      ? AppButtonType.filled
                      : AppButtonType.outlined,
                  height: 48,
                  borderRadius: 13,
                  backgroundColor: isPmSelected
                      ? AppColors.primaryBlue
                      : AppColors.white,
                  borderColor: isPmSelected
                      ? AppColors.primaryBlue
                      : AppColors.littleBlue,
                  textColor: isPmSelected
                      ? AppColors.white
                      : AppColors.darkBlue,
                  textStyle:
                      AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                    color: isPmSelected
                        ? AppColors.white
                        : AppColors.darkBlue,
                    fontWeight: FontWeight.w700,
                  ),
                  onTap: () {
                    controller.changePeriod('PM');
                  },
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}