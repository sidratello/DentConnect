import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

enum AppButtonType {
  filled,
  outlined,
  customDecoration,
}

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final AppButtonType type;
  final double width;
  final double height;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderRadius;
  final BoxDecoration? decoration;

  const AppButton({
    super.key,
    required this.title,
    required this.onTap,
    this.type = AppButtonType.filled,
    this.width = 354,
    this.height = 48,
    this.textStyle,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius = 12,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    if (type == AppButtonType.customDecoration) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: decoration,
          child: Text(
            title,
            style: textStyle ?? AppTextStyles.ibmRegular12DarkStyle,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    if (type == AppButtonType.outlined) {
      return SizedBox(
        width: width,
        height: height,
        child: OutlinedButton(
          onPressed: onTap,
          style: OutlinedButton.styleFrom(
            backgroundColor: backgroundColor ?? AppColors.littleBlue,
            side: BorderSide(
              color: borderColor ?? AppColors.primaryBlue,
              width: 1,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: Text(
            title,
            style: textStyle ??
                AppTextStyles.ibmRegular16WhiteStyle.copyWith(
                  color: AppColors.textDark,
                ),
          ),
        ),
      );
    }

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          title,
          style: textStyle ?? AppTextStyles.ibmRegular16WhiteStyle,
        ),
      ),
    );
  }
}