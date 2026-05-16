import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/auth/controller/login_controller.dart';
import 'package:template/core/app_router.dart';
import 'package:template/core/widgets/ClickableTextRow.dart';
import 'package:template/core/widgets/app_button.dart';

class LoginActionWidget extends StatelessWidget {
  const LoginActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Column(
      children: [

Align(
  alignment: Alignment.centerRight,
  child: GestureDetector(
    onTap: () {
      print('Forget Password Clicked');

      Get.toNamed(AppRouter.forgetpasswordpage);
    },
    child: const Text(
      'نسيت كلمة المرور؟',
      style: TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),


        const SizedBox(height: 10),



        Obx(
          () => AppButton(
            title: controller.isLoading.value
                ? ' ..جاري  تسحيل دخول'
                : 'تسحيل دخول',
            width: double.infinity,
            height: 39,
            type: AppButtonType.filled,
            onTap: () {
              if (!controller.isLoading.value&&
      controller.formKey.currentState!.validate()) {
                controller.loginDentist();
              }
            },
          ),
        ),

        const SizedBox(height: 3),

        ClickableTextRow(
          text: 'لبس لديك حساب؟  قم بانشاء حساب من ',
          buttonText: ' هنا  ',
          mainAxisAlignment: MainAxisAlignment.center,
          onTap: () {
        Get.offNamed(
  AppRouter.signuppage,
    arguments: controller.role,
);
          },
        ),
      ],
    );
  }
}