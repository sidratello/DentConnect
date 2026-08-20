import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_font_size.dart';



class AppTextStyles {

static TextStyle ibmBold22NeutralStyle = TextStyle(
    fontFamily: "IBM Plex Sans Arabic",
    fontWeight: FontWeight.bold,
    fontSize: AppTextSizes.h7_22,
    height: 33 / 22,
    color: AppColors.neutral1000,
  );

  // 🔹 Medium 18
  static TextStyle ibmMedium18NeutralStyle = TextStyle(
    fontFamily: "IBM Plex Sans Arabic",
    fontWeight: FontWeight.w500,
    fontSize: AppTextSizes.body18,
    height: 27 / 18,
    color: AppColors.neutral1000,
  );

  // 🔹 Regular 14
  static TextStyle ibmRegular14NeutralStyle = TextStyle(
    fontFamily: "IBM Plex Sans Arabic",
    fontWeight: FontWeight.w400,
    fontSize: AppTextSizes.body14,
    height: 21 / 14,
    color: AppColors.neutral1000,
  );




  // 🔹 Regular 12 (Dark)
  static TextStyle ibmRegular12DarkStyle = TextStyle(
    fontFamily: "IBM Plex Sans Arabic",
    fontWeight: FontWeight.w400,
    fontSize: AppTextSizes.body12,
    height: 18 / 12,
    color: AppColors.textDark,
  );

  // 🔹 Regular 16 (White)
  static TextStyle ibmRegular16WhiteStyle = TextStyle(
    fontFamily: "IBM Plex Sans Arabic",
    fontWeight: FontWeight.w400,
    fontSize: AppTextSizes.body16,
    height: 24 / 16,
    color: AppColors.white,
  );


  
}