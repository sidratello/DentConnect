import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core_dentist/theme/app_colors.dart';
import '../../../../core_dentist/utils/static.dart';
import '../../controller/lab_controller.dart';
import 'scanner_date_item.dart';

void scannerSheet(
  BuildContext context,
  LabController controller,
) {
  Get.bottomSheet(
    Container(
      padding: EdgeInsets.symmetric(
        horizontal: Static.getwidth(context, 24),
        vertical: Static.getheight(context, 24),
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: Static.getwidth(context, 48),
              height: Static.getheight(context, 5),
              decoration: BoxDecoration(
                color: Theme.of(context).shadowColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(
            height: Static.getheight(context, 24),
          ),
          Text(
            'مواعيد الماسح المتنقل',
            style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w600,
                fontSize: Static.getwidth(context, 20),
                color: AppColors.textPrimary),
          ),
          SizedBox(
            height: Static.getheight(context, 8),
          ),
          Text(
            'اختر الموعد المناسب لحجز الماسح',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w400,
              fontSize: Static.getwidth(context, 15),
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(
            height: Static.getheight(context, 24),
          ),
          ...List.generate(
            controller.availableDates.length,
            (index) {
              final slot = controller.availableSlots[index];

              return ScannerDateItem(
                date: slot.fullDisplay,
                onTap: () {
                  controller.selectDate(slot);
                },
              );
            },
          ),
        ],
      ),
    ),
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
  );
}
