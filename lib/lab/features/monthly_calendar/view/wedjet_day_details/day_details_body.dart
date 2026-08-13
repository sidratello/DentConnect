import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/AppLoadingIndicator.dart';
import 'package:template/core/widgets/EmptyStateCard.dart';
import 'package:template/lab/features/monthly_calendar/controller/calendar_day_details_controller.dart';
import 'package:template/lab/features/monthly_calendar/view/wedjet_day_details/CalendarDayStatisticsSection.dart';
import 'package:template/lab/features/monthly_calendar/view/wedjet_day_details/calendar_day_details_header.dart';
import 'package:template/lab/features/monthly_calendar/view/wedjet_day_details/calendar_orders_section.dart';
import 'package:template/lab/features/monthly_calendar/view/wedjet_day_details/calendar_scan_visits_section.dart';


class CalendarDayDetailsBody
    extends GetView<
        CalendarDayDetailsController> {
  const CalendarDayDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final details =
            controller.details.value;

        if (controller.isLoading.value &&
            details == null) {
          return const Center(
            child:
                AppLoadingIndicator(),
          );
        }

        return RefreshIndicator(
          color:
              AppColors.primaryBlue,
          onRefresh:
              controller.refreshDayDetails,
          child: ListView(
            physics:
                const AlwaysScrollableScrollPhysics(),
            padding:
                const EdgeInsets.fromLTRB(
              18,
              8,
              18,
              30,
            ),
            children: [
              CalendarDayDetailsHeader(
                date:
                    controller.selectedDate,
              ),

              const SizedBox(height: 10),

              CalendarDayStatisticsSection(
                ordersCount:
                    controller.totalOrders,
                scanVisitsCount:
                    controller
                        .totalScanVisits,
              ),

              const SizedBox(height: 22),

              if (details == null)
                const SizedBox.shrink()
              else if (controller.isEmpty)
                const EmptyStateCard(
                  title:
                      'لا توجد تفاصيل لهذا اليوم',
                  subtitle:
                      'لا توجد طلبات أو حجوزات مسح مسجلة.',
                  icon:
                      Icons.event_busy_outlined,
                )
              else ...[
   CalendarOrdersSection(
  orders:
      controller.visibleOrders,
  onOrderTap:
      controller.openOrderDetails,
),

                if (controller
                        .visibleOrders
                        .isNotEmpty &&
                    controller.scanVisits
                        .isNotEmpty)
                  const SizedBox(
                    height: 20,
                  ),

                CalendarScanVisitsSection(
                  visits:
                      controller.scanVisits,
                      date: controller.selectedDate,
                    
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}