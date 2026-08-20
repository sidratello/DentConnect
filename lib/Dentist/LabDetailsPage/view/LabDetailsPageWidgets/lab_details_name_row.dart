import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core_dentist/theme/app_colors.dart';
import '../../../../core_dentist/utils/static.dart';
import '../../../HomePage/controller/home_controller.dart';
import '../../controller/lab_controller.dart';

class LabDetailsNameRow extends StatelessWidget {
  const LabDetailsNameRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final labController = Get.find<LabController>();

    final homeController = Get.find<HomeController>();

    return Obx(
      () {
        final bool isPreviewMode = homeController.isPreviewMode.value;

        final FollowStatus followStatus = labController.followStatus.value;

        final bool isDisabled = isPreviewMode;

        final bool isPending = followStatus == FollowStatus.pending;

        final bool isFollowing = followStatus == FollowStatus.following;

        final Color borderColor = isDisabled
            ? AppColors.statusInDesign
            : isFollowing
                ? AppColors.success
                : isPending
                    ? AppColors.yellowRate
                    : AppColors.primary;

        final Color textColor = isDisabled ? AppColors.darkBlue : borderColor;

        final String buttonText = isFollowing
            ? 'متابع'
            : isPending
                ? 'بانتظار القبول'
                : 'متابعة';

        final IconData icon = isFollowing
            ? Icons.check_rounded
            : isPending
                ? Icons.schedule_rounded
                : Icons.person_add_alt_1;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// الاسم
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: Static.getwidth(context, 12),
                ),
                child: Text(
                  labController.getLabName(),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w600,
                    fontSize: Static.getwidth(context, 18),
                    height: 27 / 18,
                    color: AppColors.greyColor,
                  ),
                ),
              ),
            ),

            /// الزر
            AbsorbPointer(
              absorbing: isDisabled || isPending || isFollowing,
              child: Opacity(
                opacity: isDisabled ? 0.65 : 1,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    labController.sendFollowRequestStatus();
                    labController.sendFollowRequest(labController.getLabId());
                  },
                  child: Container(
                    width: Static.getwidth(context, 120),
                    height: Static.getheight(context, 38),
                    padding: EdgeInsets.symmetric(
                      horizontal: Static.getwidth(context, 10),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: borderColor,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          buttonText,
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans Arabic',
                            fontWeight: FontWeight.w500,
                            fontSize: Static.getwidth(context, 14),
                            color: textColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: Static.getwidth(context, 4),
                          ),
                          child: Icon(
                            icon,
                            color: textColor,
                            size: Static.getwidth(context, 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
