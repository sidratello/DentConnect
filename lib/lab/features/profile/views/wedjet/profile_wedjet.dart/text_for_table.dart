



import 'package:flutter/material.dart';
import 'package:template/core/app_text_styles.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final int flex;

  const HeaderText({
    required this.text,
    required this.flex,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}