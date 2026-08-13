import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/app_button.dart';

import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';

class LabAdPaymentSuccessScreen
    extends StatelessWidget {
  const LabAdPaymentSuccessScreen({
    super.key,
  });

  void _goBackWithSuccess() {
    Get.back(
      result: 'paymentSuccess',
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (
        didPop,
        result,
      ) {
        if (didPop) {
          return;
        }

        _goBackWithSuccess();
      },
      child: LabBackgroundLayout(
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
                    color: AppColors.green
                        .withOpacity(.12),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons
                        .check_circle_rounded,
                    color:
                        AppColors.green,
                    size: 58,
                  ),
                ),

                const SizedBox(
                  height: 22,
                ),

                Text(
                  'تم الدفع بنجاح',
                  textAlign:
                      TextAlign.center,
                  style: AppTextStyles
                      .ibmBold22NeutralStyle
                      .copyWith(
                    color:
                        AppColors.darkBlue,
                  ),
                ),

                const SizedBox(
                  height: 8,
                ),

                Text(
                  'تم استلام دفع الإعلان بنجاح.',
                  textAlign:
                      TextAlign.center,
                  style: AppTextStyles
                      .ibmRegular14NeutralStyle
                      .copyWith(
                    color:
                        AppColors.normalText,
                  ),
                ),

                const SizedBox(
                  height: 28,
                ),

                AppButton(
                  title:
                      'العودة إلى إعلاناتي',
                  type:
                      AppButtonType.gradient,
                  onTap:
                      _goBackWithSuccess,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}