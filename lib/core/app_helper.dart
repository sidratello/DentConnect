
import 'dart:ui';


import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';





class AppHelper {

  static String token = '';



  static void clear() {
    token = '';
  }
static Future<void> saveUserInfo(String token) async {
  AppHelper.token = token;



}


  static double get screenWidth {
    final view = PlatformDispatcher.instance.views.first;
    return view.physicalSize.width / view.devicePixelRatio;
  }

  static double get screenHeight {
    final view = PlatformDispatcher.instance.views.first;
    return view.physicalSize.height / view.devicePixelRatio;
  }

  static BorderRadius borderRadius() {
    return BorderRadius.circular(10);
  }



static BoxDecoration primaryButtonDecoration() {
  return BoxDecoration(
    color: AppColors.primary200,
    borderRadius: BorderRadius.circular(12),
    image: const DecorationImage(
      image: AssetImage('assets/images/Frame 2608747 (1)_cleanup.png'),
      alignment: Alignment.centerLeft,
      fit: BoxFit.cover,
      opacity: 0.35,
    ),
  );
}

  static BoxDecoration glassBoxDecoration({double opacity = .12}) {
    return BoxDecoration(
      borderRadius: borderRadius(),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          // AppColors.creamWhite.withOpacity(opacity * 1.2),
          // AppColors.creamWhite.withOpacity(opacity * .7),
        ],
      ),
      border: Border.all(
        // color: AppColors.creamWhite.withOpacity(.85),
        width: 1.2,
      ),
    );
  }

  static void showBirthdayDatePicker(
    BuildContext context,
    TextEditingController conteroller,
  ) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      // helpText: LocalKeys.selectDate,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              // primary: AppColors.primaryPurple,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                // foregroundColor: AppColors.primaryPurple,
              ),
            ),
          ),
          child: child!,
        );
      },
    )?.then((value) => value);

    if (picked != null) {
      final formattedDate = "${picked.year}-${picked.month}-${picked.day}";
      conteroller.text = formattedDate;
    }
  }

  // static SvgPicture viewSvg(String path, {Color? color, double? height}) {
  //   return SvgPicture.asset(path, color: color, height: height);
  // }

  static ImageProvider viewAsset(String path) {
    return AssetImage(path);
  }

  static void showLoading() {
    // Get.dialog(const LoadingIndicator(), barrierDismissible: false);
  }

  // static void showSuccesDialog(String message) {
  //   Get.dialog(SuccessDialog(body: message), barrierDismissible: true);
  // }

  // static void showErrorDialog(String message) {
  //   Get.dialog(ErrorDialog(body: message), barrierDismissible: true);
  // }





  static bool validatePhoneNumber(String phone) {
    final regex = RegExp(r'^09\d{8}$');
    return regex.hasMatch(phone);
  }

  static bool validatePassword(String phone) {
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');
    return regex.hasMatch(phone);
  }

 
  static String fmtviews(int v) {
    if (v >= 1000000) return '${(v / 1000000).toStringAsFixed(1)}M';
    if (v >= 1000) return '${(v / 1000).toStringAsFixed(1)}k';
    return '$v';
  }
}
