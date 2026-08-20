import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/app_button.dart';
import 'package:template/core/widgets/custom_action_dialog.dart';

class ScanServiceUnavailableDialog {
  const ScanServiceUnavailableDialog._();

  static Future<void> show({
    required String message,
  }) async {
    final displayedMessage = _getDisplayedMessage(
      message,
    );

    await CustomActionDialog.show<void>(
      title: 'خدمة المسح غير مفعّلة',
      barrierDismissible: false,
      cancelText: null,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildIcon(),

          const SizedBox(height: 18),

          Text(
            displayedMessage,
            textAlign: TextAlign.center,
            style: AppTextStyles
                .ibmRegular14NeutralStyle
                .copyWith(
              color: AppColors.normalText,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 24),

          AppButton(
            title: 'حسناً',
            onTap: Get.back,
            type: AppButtonType.gradient,
            height: 50,
            borderRadius: 14,
            icon: const Icon(
              Icons.check_rounded,
              color: AppColors.white,
              size: 21,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildIcon() {
    return Container(
      width: 76,
      height: 76,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue.withOpacity(
          0.07,
        ),
        shape: BoxShape.circle,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryBlue.withOpacity(
            0.12,
          ),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.document_scanner_outlined,
          color: AppColors.primaryBlue,
          size: 34,
        ),
      ),
    );
  }

  static String _getDisplayedMessage(
    String message,
  ) {
    final normalizedMessage = message.trim();

    if (normalizedMessage.isEmpty) {
      return 'خدمة المسح الضوئي غير متاحة لهذا المخبر حالياً.';
    }

    return normalizedMessage;
  }
}