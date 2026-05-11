import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/auth/controller/signup_controller.dart';
import 'package:template/core/app_router.dart';
import 'package:template/core/widgets/ClickableTextRow.dart';
import 'package:template/core/widgets/app_button.dart';

/// ================= ACTION WIDGET =================


class SignupActionWidget extends StatelessWidget {
  const SignupActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();

    return Column(
      children: [
        Obx(
          () => AppButton(
            title: controller.isLoading.value
                ? 'جاري الإنشاء...'
                : 'إنشاء حساب',
            width: double.infinity,
            height: 39,
            type: AppButtonType.filled,
            onTap: () {
              if (!controller.isLoading.value &&
                  controller.formKey.currentState!.validate()) {
                controller.signupDentist();
              }
            },
          ),
        ),

        const SizedBox(height: 10),

        AppButton(
          title: 'المتابعة بوضع الاطلاع',
          width: double.infinity,
          height: 39,
          type: AppButtonType.outlined,
          onTap: () {},
        ),

        const SizedBox(height: 3),

        ClickableTextRow(
          text: 'لديك حساب؟ سجل دخول من ',
          buttonText: ' هنا  ',
          mainAxisAlignment: MainAxisAlignment.center,
          onTap: () {
         Get.offNamed(AppRouter.loginpage);
          },
        ),
      ],
    );
  }
}