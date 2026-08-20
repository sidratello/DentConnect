import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// استيراد ملفات الألوان والخطوط الخاصة بمشروعك
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart'; 


class CustomEmptyState extends StatelessWidget {
  final String title;
  final String subtitle;
  final String animationPath;
  final double animationSize;
  final MainAxisAlignment mainAxisAlignment;

  const CustomEmptyState({
    super.key,
    required this.title,
    required this.subtitle,
    this.animationPath = 'assets/animation/sad face (1).json',
    this.animationSize = 220,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableHeight = constraints.maxHeight;

        final double responsiveAnimationSize =
            availableHeight < 350 ? 140 : animationSize;

        return SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: mainAxisAlignment,
              children: [
                Lottie.asset(
                  animationPath,
                  width: responsiveAnimationSize,
                  height: responsiveAnimationSize,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 16),

                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
                    color: AppColors.darkBlue,
                  ),
                ),

                const SizedBox(height: 8),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style:
                        AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                      color: AppColors.normalText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}