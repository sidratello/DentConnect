import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/case_order_details/views/widget/details_section_card.dart';

import '../../controller/update_scan_slot_controller.dart';

import '../wedjet_add_scan_slot/scan_date_field.dart';
import '../wedjet_add_scan_slot/scan_period_selector.dart';
import '../wedjet_add_scan_slot/scan_time_field.dart';

import 'current_scan_slot_card.dart';
import 'update_scan_slot_button.dart';
import 'update_scan_slot_header.dart';

class UpdateScanSlotBody
    extends GetView<UpdateScanSlotController> {
  const UpdateScanSlotBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Obx(
        () {
          final slot = controller.originalSlot;

          if (slot == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            physics:
                const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(
              20,
              5,
              20,
              30,
            ),
            children: [
              const UpdateScanSlotHeader(),

              CurrentScanSlotCard(
                slot: slot,
              ),

              const SizedBox(height: 14),

              Text(
                'تعديل الموعد',
                style: AppTextStyles
                    .ibmMedium18NeutralStyle
                    .copyWith(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 10),

              DetailsSectionCard(
                padding: const EdgeInsets.all(14),
                child: Column(
                  children: [
                    ScanDateField(
                      controller: controller,
                    ),

                    const SizedBox(height: 18),

                    ScanTimeField(
                      controller: controller,
                    ),

                    const SizedBox(height: 18),

                    ScanPeriodSelector(
                      controller: controller,
                    ),

                    const SizedBox(height: 18),

                    Container(
                      width: double.infinity,
                      padding:
                          const EdgeInsets.all(13),
                      decoration: BoxDecoration(
                        color: AppColors
                            .primaryBlue
                            .withOpacity(.05),
                        borderRadius:
                            BorderRadius.circular(
                                12),
                        border: Border.all(
                          color:
                              AppColors.littleBlue,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.info_outline,
                            color: AppColors
                                .primaryBlue,
                            size: 21,
                          ),
                          const SizedBox(width: 9),
                          Expanded(
                            child: Text(
                              'يمكنك تعديل التاريخ والوقت والفترة حسب التوفر المتاح.',
                              style: AppTextStyles
                                  .ibmRegular14NeutralStyle
                                  .copyWith(
                                color:
                                    AppColors.darkBlue,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    const UpdateScanSlotButton(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}