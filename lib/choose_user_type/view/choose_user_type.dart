import 'package:flutter/material.dart';
import 'package:get/get.dart';



import 'package:template/core/app_colors.dart';

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
                   SizedBox(height: MediaQuery.of(context).size.height * 0.08),

                  Image.asset(
                    'assets/images/5f32c4cd4261ca921e09f8d99da60f9ebbc6a63b.png',
                    width: 230,
                    height: 230,
                     fit: BoxFit.contain,
                  ),
 
                 
                  Text(
                    'مرحباً بك في تطبيق',
                    style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                      color: AppColors.textDark.withOpacity(0.75),
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 4),

                  Text(
                    'DentConnect',
                    style: AppTextStyles.ibmBold22NeutralStyle.copyWith(
                      fontSize: 26,
                      color: AppColors.neutral1000,
                   ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 42),


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
  type: AppButtonType.gradient,
  icon: const Icon(
    Icons.medical_services_outlined,

  ),
  onTap: () {
    Get.toNamed(AppRouter.signuppage,
     arguments: 'Dentist',
    );
    
  },
),
                 SizedBox(height: 14),

                  AppButton(
                    title: 'مخابر',
                    type: AppButtonType.gradient,
                    height: 56,
                    borderRadius: 18,
                    icon: const Icon(
       Icons.biotech_outlined,
                  
                      size: 23,
                    ),
                    onTap: () {
                          Get.toNamed(AppRouter.signuppage,
                          arguments: 'Lab',
                          );
   
                      // Get.toNamed(AppRouter.labSignupPage);
                    },
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