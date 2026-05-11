import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/auth/controller/otp_controller.dart';
import 'package:template/core/widgets/ClickableTextRow.dart';
import 'package:template/core/widgets/app_button.dart';

class OtpActionWidget extends StatelessWidget {
  const OtpActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OtpController>();

    return Column(
      children: [
        Obx(
          () => AppButton(
            title: controller.isLoading.value
                ? ' ..جاري التحقق '
                : 'تأكيد الرمز',
            width: double.infinity,
            height: 45,
            type: AppButtonType.filled,
            onTap: () {
              if (!controller.isLoading.value) {
                controller.verifyOtp();
              }
            },
          ),
        ),

        const SizedBox(height: 3),

Obx(
  () => ClickableTextRow(
    text: ' انتهت صلاحية الرمز؟ ',
    buttonText: controller.isResending.value
        ? '  ..جاري الإرسال'
        : 'إرسال رمز جديد',
    mainAxisAlignment: MainAxisAlignment.center,
    onTap: () {
      if (!controller.isResending.value) {
        controller.resendOtp();
      }
    },
  ),
),
      ],
    );
  }
}