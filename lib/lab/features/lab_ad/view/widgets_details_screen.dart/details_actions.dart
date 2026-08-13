import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/app_button.dart';

import '../../controller/lab_ad_details_controller.dart';

class LabAdDetailsActions
    extends GetView<
        LabAdDetailsController> {
  const LabAdDetailsActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (!controller
        .isPendingPayment) {
      return const SizedBox
          .shrink();
    }

    return Container(
      padding:
          EdgeInsets.fromLTRB(
        20,
        12,
        20,
        12 +
            MediaQuery.paddingOf(
              context,
            ).bottom,
      ),
      decoration: BoxDecoration(
        color: AppColors
            .background
            .withOpacity(.97),
        border: Border(
          top: BorderSide(
            color: AppColors
                .littleBlue
                .withOpacity(.65),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors
                .darkBlue
                .withOpacity(.05),
            blurRadius: 12,
            offset:
                const Offset(
              0,
              -4,
            ),
          ),
        ],
      ),
      child: Obx(
        () => AppButton(
          title: 'ادفع الآن',
          type:
              AppButtonType.gradient,
          height: 52,
          borderRadius: 13,
          isLoading:
              controller
                  .isPaying.value,
          onTap: controller
              .payAdvertisement,
          icon: const Icon(
            Icons
                .payments_outlined,
            color:
                AppColors.white,
            size: 21,
          ),
        ),
      ),
    );
  }
}