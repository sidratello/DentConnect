import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class ClickableTextRow extends StatelessWidget {
  final String text;
  final String buttonText;
  final VoidCallback onTap;
  final TextAlign textAlign;
  final MainAxisAlignment mainAxisAlignment;

  const ClickableTextRow({
    super.key,
    required this.text,
    required this.buttonText,
    required this.onTap,
    this.textAlign = TextAlign.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      textDirection: TextDirection.rtl,
      children: [
        Text(
          text,
          style: AppTextStyles.ibmRegular12DarkStyle,
          textAlign: textAlign,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            buttonText,
            style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
              color: AppColors.primaryBlue,
            ),
          ),
        ),
      ],
    );
  }
}