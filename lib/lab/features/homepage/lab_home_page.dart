import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_router.dart';
import 'package:template/core/widgets/custom_bottom_nav.dart';
import 'package:template/lab/features/homepage/wedjet/labhomeview.dart';
class LabHomePage extends StatelessWidget {
  const LabHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AppColors.background,

      bottomNavigationBar:
          CustomBottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Get.toNamed(
              AppRouter.penndingPosts,
            );
          }

          if (index == 2) {
            Get.toNamed(
              AppRouter.labAds,
            );
          }

          if (index == 3) {
            Get.toNamed(
              AppRouter.profile,
            );
          }
        },
      ),

      body: Stack(
        children: [
          Container(
            height: 300,
            decoration:
                const BoxDecoration(
              color:
                  AppColors.darkBlue,
              borderRadius:
                  BorderRadius.only(
                bottomLeft:
                    Radius.circular(36),
                bottomRight:
                    Radius.circular(36),
              ),
            ),
          ),

          const LabHomeView(),
        ],
      ),
    );
  }
}