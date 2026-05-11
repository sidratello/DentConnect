import 'package:flutter/material.dart';
import 'package:get/get.dart';



import 'package:template/core/app_colors.dart';
import 'package:template/core/app_helper.dart';
import 'package:template/core/app_router.dart';

import 'package:template/core/app_text_styles.dart';

import 'package:template/core/widgets/app_button.dart';





class ChooseUserTypeScreen extends StatelessWidget {
  const ChooseUserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          /// background image fixed at bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Opacity(
              opacity: 0.7,
              child: Image.asset(
                'assets/images/Vector.png',
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
                fit: BoxFit.fill,
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  const SizedBox(height: 70),

                  Image.asset(
                    'assets/images/5f32c4cd4261ca921e09f8d99da60f9ebbc6a63b.png',
                    width: 400,
                    height: 200,
                  ),

                  Text(
                    ' DentConnect مرحباً بك في تطبيق    ',
                    style: AppTextStyles.ibmBold22NeutralStyle.copyWith(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 45),

                  Text(
                    ' :  سجل دخولك ك  ',
                    style: AppTextStyles.ibmRegular16WhiteStyle.copyWith(
                      color: AppColors.textDark,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 10),

                  AppButton(
                    title: 'أطباء',
                    type: AppButtonType.customDecoration,
                    decoration: AppHelper.primaryButtonDecoration(),
                    textStyle: AppTextStyles.ibmRegular12DarkStyle,
                    onTap: () {
                      Get.toNamed(AppRouter.signuppage);
                    },
                  ),

                  const SizedBox(height: 12),

                  AppButton(
                    title: 'مخبر',
                    type: AppButtonType.customDecoration,
                    decoration: AppHelper.primaryButtonDecoration(),
                    textStyle: AppTextStyles.ibmRegular12DarkStyle,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}