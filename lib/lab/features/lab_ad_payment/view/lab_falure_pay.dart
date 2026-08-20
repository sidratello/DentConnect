
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/app_button.dart';

import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';



class LabAdPaymentFailedScreen
    extends StatelessWidget {
  const LabAdPaymentFailedScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LabBackgroundLayout(
      child: Center(
        child: Padding(
          padding:
              const EdgeInsets.all(24),
          child: Column(
            mainAxisSize:
                MainAxisSize.min,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: AppColors.red
                      .withOpacity(.10),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons
                      .error_outline_rounded,
                  color: AppColors.red,
                  size: 55,
                ),
              ),

              const SizedBox(height: 22),

              Text(
                'لم تكتمل عملية الدفع',
                style: AppTextStyles
                    .ibmBold22NeutralStyle
                    .copyWith(
                  color:
                      AppColors.darkBlue,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'حدث خطأ أثناء عملية الدفع. يمكنك المحاولة مرة أخرى.',
                textAlign:
                    TextAlign.center,
                style: AppTextStyles
                    .ibmRegular14NeutralStyle
                    .copyWith(
                  color:
                      AppColors.normalText,
                ),
              ),

              const SizedBox(height: 28),

              AppButton(
                title: 'إعادة المحاولة',
                type:
                    AppButtonType.gradient,
                onTap: () {
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}