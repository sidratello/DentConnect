import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_router.dart';
import 'package:template/core_dentist/utils/static.dart';

class AppbarHomeVectorBlack extends StatelessWidget {
  const AppbarHomeVectorBlack({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Static.getwidth(context, 24),
      ),
      child: GestureDetector(
        onTap: () {
          Get.offAllNamed(AppRouter.choseuserpage);
        },
        child: Image.asset(
          'assets/images/vector_back_black.png',
          width: Static.getwidth(context, 32),
          height: Static.getheight(context, 37.57),
        ),
      ),
    );
  }
}
