import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/auth/controller/forpa_controller.dart';


import 'package:template/core/widgets/app_button.dart';

class fpActionWidget extends StatelessWidget {
  const fpActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ForgetPasswordController>();

    return Column(
      children: [
   Obx(
          () => AppButton(
            title: controller.isLoading.value
                ? ' .. جاري الإرسال'
                : 'إرسال رمز التحقق',
            width: double.infinity,
            height: 45,
            type: AppButtonType.filled,
            onTap: () {
              if (!controller.isLoading.value) {
                controller.forgotPassword();
              }
            },
          ),
        ),

        

        const SizedBox(height: 3),


      ],
    );
  }
}