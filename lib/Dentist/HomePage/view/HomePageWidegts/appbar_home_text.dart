import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/HomePage/controller/home_controller.dart';
import 'package:template/core_dentist/utils/static.dart';

class AppbarHomeText extends StatelessWidget {
  final bool isPreviewMode;

  const AppbarHomeText({
    super.key,
    required this.isPreviewMode,
  });

  @override
  Widget build(BuildContext context) {
    if (isPreviewMode) {
      return Text(
        'مرحبا بك',
        style: TextStyle(
          fontFamily: 'IBM Plex Sans Arabic',
          fontWeight: FontWeight.w700,
          fontSize: Static.getwidth(context, 22),
        ),
      );
    }

    return Obx(() {
      final doctor = HomeController.to.doctorProfileModel.value;
      final doctorName = doctor?.name?.split(' ').first ?? '';

      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'مرحبا بك دكتور ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w700,
              fontSize: Static.getwidth(context, 22),
              letterSpacing: 0,
            ),
          ),
          Text(
            doctorName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w700,
              fontSize: Static.getwidth(context, 22),
              letterSpacing: 0,
            ),
          ),
        ],
      );
    });
  }
}
