import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core_dentist/theme/app_colors.dart';
import '../../../../core_dentist/utils/static.dart';
import '../../../HomePage/controller/home_controller.dart';
import '../../controller/lab_controller.dart';
import 'availability_status_text.dart';
import 'scanner_sheet.dart';

class LabDetailsAvailabillityRow extends StatelessWidget {
  const LabDetailsAvailabillityRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LabController>();

    final homeController = Get.find<HomeController>();

    return Obx(
      () {
        final scannerStatus = controller.scannerStatus.value;
        final bool isPreviewMode = homeController.isPreviewMode.value;
        final bool isFollowing =
            controller.followStatus.value == FollowStatus.following;
        final bool canOpen = scannerStatus != ScannerStatus.unavailable &&
            !isPreviewMode &&
            isFollowing;

        final String scannerText = scannerStatus == ScannerStatus.booked
            ? 'تم الحجز'
            : scannerStatus == ScannerStatus.available
                ? 'متوفر'
                : 'غير متوفر';

        final Color scannerColor = scannerStatus == ScannerStatus.unavailable
            ? AppColors.error
            : !canOpen
                ? AppColors.greyColor
                : AppColors.success;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'التوافر:',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w500,
                    fontSize: Static.getwidth(context, 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: Static.getwidth(context, 4),
                  ),
                  child: AvailabilityStatusText(
                    text:
                        controller.isLabAvailable.value ? 'متوفر' : 'غير متوفر',
                    color: controller.isLabAvailable.value
                        ? AppColors.success
                        : AppColors.error,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: canOpen
                  ? () {
                      if (controller.availableSlots.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('لا توجد مواعيد متاحة للماسح المتنقل'),
                            backgroundColor: AppColors.lightRed,
                          ),
                        );
                      } else {
                        scannerSheet(
                          context,
                          controller,
                        );
                      }
                    }
                  : null,
              child: Opacity(
                opacity: canOpen ? 1 : 0.65,
                child: Row(
                  children: [
                    Text(
                      'ماسح متنقل:',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w500,
                        fontSize: Static.getwidth(context, 18),
                        color:
                            canOpen ? AppColors.textPrimary : AppColors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: Static.getwidth(context, 4),
                      ),
                      child: AvailabilityStatusText(
                        text: scannerText,
                        color: scannerColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
