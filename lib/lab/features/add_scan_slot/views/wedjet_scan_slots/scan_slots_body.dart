import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_helper.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/AppLoadingIndicator.dart';
import 'package:template/core/widgets/EmptyStateCard.dart';
import 'package:template/lab/features/add_scan_slot/model/scan_slot_model.dart';
import 'package:template/lab/features/add_scan_slot/views/booking_details_dialog/scan_booking_details_dialog.dart';
import 'package:template/lab/features/add_scan_slot/views/wedjet_scan_slots/ScanSlotsAddAction.dart';
import 'package:template/lab/features/add_scan_slot/views/wedjet_scan_slots/delete_scan_slot_dialog.dart';
import 'package:template/lab/features/add_scan_slot/views/wedjet_scan_slots/scan_filter_tabs.dart';
import 'package:template/lab/features/add_scan_slot/views/wedjet_scan_slots/scan_period_section.dart';
import 'package:template/lab/features/add_scan_slot/views/wedjet_scan_slots/scan_slots_header.dart';
import 'package:template/lab/features/add_scan_slot/views/wedjet_scan_slots/scan_statistics_row.dart';
import 'package:template/lab/shared/wedjet/scan_date_navigation_card.dart';

import '../../../../../../core/app_colors.dart';
import '../../controller/scan_slots_controller.dart';
import 'package:template/core/app_router.dart';

class ScanSlotsBody extends GetView<ScanSlotsController> {
  const ScanSlotsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
       

          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
       return const AppLoadingIndicator();
              }

              return RefreshIndicator(
                color: AppColors.primaryBlue,
                onRefresh: controller.loadData,
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(
                    16,
                    0,
                    16,
                    18,
                  ),
                  children: [
ScanSlotsHeader(

),
                       
                    ScanDateNavigationCard(
                      selectedDate:
                          controller.selectedDate.value,
                      onPrevious: controller.previousDate,
                      onNext: controller.nextDate,
                      onDateTap: () {
                        controller.pickDate(context);
                      },
                    ),

                    const SizedBox(height: 14),

                    const ScanStatisticsRow(),
 const SizedBox(height: 14),

                    const ScanFilterTabs(),

                    const SizedBox(height: 14),
  
        
                    if (controller.filteredSlots.isEmpty)
                   const EmptyStateCard(
  title: 'لا توجد مواعيد في هذا التاريخ',
  subtitle:
      'يمكنك اختيار تاريخ آخر أو إضافة موعد جديد',
)
                    else ...[
                      if (controller.morningSlots.isNotEmpty)
                        ScanPeriodSection(
                          title: 'صباحاً',
                          period: 'AM',
                          icon: Icons.wb_sunny_outlined,
                          slots: controller.morningSlots,
onEdit: (slot) async {
  final result = await Get.toNamed(
    AppRouter.updateScanSlot,
    arguments: slot,
  );

  if (result is! Map<String, dynamic>) {
    return;
  }

  final updatedSlot = result['slot'];

  if (result['success'] == true &&
      updatedSlot is ScanSlotModel) {
    controller.replaceUpdatedSlot(
      updatedSlot,
    );
  }
},
                    onDelete: (slot) {
    DeleteScanSlotDialog.show(
      context: context,
      slot: slot,
      controller: controller,
    );
  },
 onBookingDetails: (slot) {
  AppHelper.showScanBookingDetails(
    context: context,
    slot: slot,
    controller: controller,
  );
},
                        ),

                      if (controller.morningSlots.isNotEmpty &&
                          controller.eveningSlots.isNotEmpty)
                        const SizedBox(height: 16),

                      if (controller.eveningSlots.isNotEmpty)
                        ScanPeriodSection(
                          title: 'مساءً',
                          period: 'PM',
                          icon: Icons.nightlight_round,
                          slots: controller.eveningSlots,
onEdit: (slot) async {
  final result = await Get.toNamed(
    AppRouter.updateScanSlot,
    arguments: slot,
  );

  if (result is! Map<String, dynamic>) {
    return;
  }

  final updatedSlot = result['slot'];

  if (result['success'] == true &&
      updatedSlot is ScanSlotModel) {
    controller.replaceUpdatedSlot(
      updatedSlot,
    );
  }
},
                                      onDelete: (slot) {
    DeleteScanSlotDialog.show(
      context: context,
      slot: slot,
      controller: controller,
    );
  },
                    onBookingDetails: (slot) {
  final booking = controller.bookingForSlot(
    slot.id,
  );

  if (booking == null) {
    Get.snackbar(
      'تنبيه',
      'لم يتم العثور على بيانات الحجز',
      snackPosition: SnackPosition.BOTTOM,
    );

    return;
  }

  ScanBookingDetailsDialog.show(
    context: context,
    booking: booking,
  );
},
                        ),

                    ],

        
            
   Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: () {
              Get.toNamed(AppRouter.bookedScanAppointments);
            },
     
            label: Text(
              'هل ترغب في عرض المواعيد المحجوزة ؟',
              style: AppTextStyles
                  .ibmRegular14NeutralStyle
                  .copyWith(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ),
        ),
              const SizedBox(height: 2),
                  ],
                ),
              );
            }),
          ),

ScanSlotsAddAction(
  onTap: () async {
    final result = await Get.toNamed(
      AppRouter.addScanSlot,
    );

    if (result is! Map) {
      return;
    }

    final newSlot = result['slot'];

    if (result['success'] == true &&
        newSlot is ScanSlotModel) {
await controller.loadData();
      if (newSlot.date != null) {
        controller.selectedDate.value =
            controller.normalizeDate(
          newSlot.date!,
        );
      }
      final message =
          result['message']?.toString();

      if (message != null &&
          message.isNotEmpty) {
        Get.snackbar(
          'تمت الإضافة',
          message,
          snackPosition:
              SnackPosition.BOTTOM,
        );
      }
    }
  },
),
        ],
      ),
    );
  }








  
}
