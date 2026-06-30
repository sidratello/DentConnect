import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class AppPageHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final VoidCallback? onBack;

  const AppPageHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 0, 0, 18),
      child: Stack(
        children: [
          Row(
            children: [
              Transform.translate(
                offset: const Offset(0, 5),
                child: SizedBox(
                  width: 110,
                  height: 90,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.ibmBold22NeutralStyle.copyWith(
                        color: AppColors.darkBlue,
                      ),
                    ),

                    Text(
                      subtitle,
                      style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                        color: AppColors.normalText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Positioned(
            left: 0,
            top: 15,
            child: GestureDetector(
              onTap: onBack ?? () => Get.back(),
              child: const Directionality(
                textDirection: TextDirection.ltr,
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 28,
                  color: AppColors.darkBlue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}