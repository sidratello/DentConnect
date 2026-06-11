import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class InfoText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final int? maxLines;

  const InfoText(
    this.text, {
    super.key,
    this.style,
    this.textAlign = TextAlign.right,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
      style: style ??
          AppTextStyles.ibmRegular14NeutralStyle.copyWith(
            color: color ?? AppColors.textDark,
            fontWeight: fontWeight,
            fontSize: fontSize?.sp,
          ),
    );
  }
}