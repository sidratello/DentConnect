import 'package:flutter/material.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/app_text_styles.dart';

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
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: Text(
            title,
            style: AppTextStyles.ibmBold22NeutralStyle
                .copyWith(color: AppColors.darkBlue),
          ),
        ),
        Positioned(
          left: 0,
          child: GestureDetector(
            onTap: onBack,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 30,
                color: AppColors.darkBlue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
