import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/app_button.dart';

class SubscriptionRequiredDialog {
  static Future<void> show({
    required VoidCallback onRenew,
  }) {
    return Get.dialog<void>(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: AppColors.littleBlue
                  .withOpacity(.6),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.darkBlue
                    .withOpacity(.08),
                blurRadius: 24,
                offset: const Offset(
                  0,
                  8,
                ),
              ),
            ],
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: AppColors.littleBlue
                        .withOpacity(.35),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons
                        .workspace_premium_outlined,
                    size: 38,
                    color:
                        AppColors.primaryBlue,
                  ),
                ),

                const SizedBox(
                  height: 18,
                ),

                // Title
                Text(
                  'الاشتراك غير فعال',
                  textAlign: TextAlign.center,
                  style: AppTextStyles
                      .ibmBold22NeutralStyle
                      .copyWith(
                    color: AppColors.darkBlue,
                    fontSize: 20,
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                // Description
                Text(
              'انتهت صلاحية اشتراكك. قم بتجديد الاشتراك لمتابعة استخدام حسابك',
                  textAlign: TextAlign.center,
                  style: AppTextStyles
                      .ibmRegular14NeutralStyle
                      .copyWith(
                    color:
                        AppColors.normalText,
                    height: 1.7,
                  ),
                ),

                const SizedBox(
                  height: 22,
                ),

 

                AppButton(
                  title:
                      'تجديد الاشتراك',
                  type:
                      AppButtonType.gradient,
                  height: 52,
                  borderRadius: 12,
            
                  onTap: onRenew,
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}