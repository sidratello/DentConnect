import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/auth/controller/signup_controller.dart';
import 'package:template/auth/view/wedjet_signup/scroll_dots_indicator.dart';
import 'package:template/auth/view/wedjet_signup/signup_firstpage.dart';
import 'package:template/auth/view/wedjet_signup/signup_secoundpage.dart';
import 'package:template/auth/view/wedjet_signup/signup_thirdpage.dart';

/// ================= BODY WIDGET =================


class SignupBodyWidget extends StatelessWidget {
  const SignupBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.28,
          child: PageView(
            controller: controller.pageController,
            onPageChanged: controller.changePage,
            children: const [
              SignupFirstPage(),
              SignupSecondPage(),
              SignupthirdPage(),
            ],
          ),
        ),

        Obx(
          () => ScrollDotsIndicator(
            currentPage: controller.currentPage.value,
          ),
        ),

        const SizedBox(height: 10),
      ],
    );
  }
}