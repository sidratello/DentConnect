import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:template/auth/controller/reset_password_controller.dart';


import 'package:template/core/widgets/app_button.dart';

class ResetPasswordActionWidget extends StatelessWidget {
  const ResetPasswordActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ResetPasswordController>();

    return Column(
      children: [
   Obx(
          () => AppButton(
            title: controller.isLoading.value
                ? ' .. جاري الإرسال'
                : 'تعيين كلمة مرور جديدة ',
            width: double.infinity,
            height: 45,
            type: AppButtonType.filled,
            onTap: () {
              if (!controller.isLoading.value) {
                controller.resetPassword();
              }
            },
          ),
        ),

        

        const SizedBox(height: 3),


      ],
    );
  }
}