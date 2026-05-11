import 'package:flutter/material.dart';
import 'package:template/core/app_text_styles.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;

  const AuthHeader({
    super.key,
    required this.title,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
  
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onBack,
          child: const Icon(
            Icons.arrow_circle_left_outlined,
            size: 34,
          ),
        ),

    
        Text(
          title,
          style: AppTextStyles.ibmBold22NeutralStyle,
        ),

  
        const SizedBox(width: 34),
      ],
    );
  }
}