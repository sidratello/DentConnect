import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/static.dart';
import '../../../HomePage/controller/home_controller.dart';
import '../../controller/lab_controller.dart';

class LabCreateRequestButton extends StatelessWidget {
  const LabCreateRequestButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final labController = Get.find<LabController>();

    final homeController = Get.find<HomeController>();

    return Obx(
      () {
        final FollowStatus followStatus = labController.followStatus.value;

        final bool isDisabled = !labController.isLabAvailable.value ||
            homeController.isPreviewMode.value ||
            followStatus == FollowStatus.pending ||
            followStatus == FollowStatus.notFollowing;

        final String buttonText = followStatus == FollowStatus.notFollowing
            ? 'يجب متابعة المخبر أولاً'
            : followStatus == FollowStatus.pending
                ? 'بانتظار قبول المتابعة'
                : 'انشاء طلب مع المخبر';

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Static.getwidth(context, 24),
            vertical: Static.getheight(context, 20),
          ),
          child: AbsorbPointer(
            absorbing: isDisabled,
            child: Opacity(
              opacity: isDisabled ? 0.65 : 1,
              child: InkWell(
                borderRadius: BorderRadius.circular(18),
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: Static.getheight(context, 50),
                  padding: EdgeInsets.symmetric(
                    horizontal: Static.getwidth(context, 14),
                    vertical: Static.getheight(context, 6),
                  ),
                  decoration: BoxDecoration(
                    color:
                        isDisabled ? AppColors.littleBlue : AppColors.boxBlue,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: isDisabled ? AppColors.white : AppColors.boxBlue,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      buttonText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w500,
                        fontSize: Static.getwidth(context, 16),
                        color: isDisabled
                            ? AppColors.greyColor
                            : AppColors.greyLight,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
