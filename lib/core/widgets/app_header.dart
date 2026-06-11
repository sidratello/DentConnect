import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class AuthHeader extends StatelessWidget {

  final String? title;

  final VoidCallback? onBack;

  final Widget? rightWidget;

  final bool showBackButton;

  const AuthHeader({
    super.key,
    this.title,
    this.onBack,
    this.rightWidget,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37,
      child: Stack(
        alignment: Alignment.center,

        children: [

          /// title
          if (title != null)
            Center(
              child: Text(
                title!,
                style: AppTextStyles.ibmBold22NeutralStyle.copyWith(
                  color: AppColors.darkBlue,
                ),
              ),
            ),

          /// back button
          if (showBackButton)
            Positioned(
              left: 0,
              child: GestureDetector(
                onTap: onBack,
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 28,
                    color: AppColors.darkBlue,
                  ),
                ),
              ),
            ),

          /// right widget
          if (rightWidget != null)
            Positioned(
              right: 0,
              child: rightWidget!,
            ),
        ],
      ),
    );
  }
}