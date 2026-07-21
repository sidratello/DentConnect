import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class AppPageHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  /// Use this when you want to display an asset image.
  final String? imagePath;

  /// Use this when you want to display an icon instead of an image.
  final IconData? icon;
final Widget? action;
  final VoidCallback? onBack;

  const AppPageHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.imagePath,
    this.icon,
    this.onBack,
    this.action,
  }) : assert(
         imagePath != null || icon != null,
         'You must provide either imagePath or icon.',
       );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 0, 0, 13),
      child: Stack(
        children: [
          Row(
          
            children: [
              Transform.translate(
                offset: const Offset(0, 5),
                child: SizedBox(
                  width: 110,
                  height: 90,
                  child: _buildHeaderVisual(),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
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
            left: -11,
            top: 15,
            child: GestureDetector(
              onTap: onBack ?? () => Get.back(),
              behavior: HitTestBehavior.opaque,
              child: const Padding(
                padding: EdgeInsets.all(4),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 28,
                    color: AppColors.darkBlue,
                  ),
                ),
              ),
            ),
          ),
          if (action != null) action!,
        ],
      ),
    );
  }

  Widget _buildHeaderVisual() {
    if (imagePath != null && imagePath!.isNotEmpty) {
      return Image.asset(
        imagePath!,
        fit: BoxFit.contain,
      );
    }

    return Icon(
      icon ?? Icons.image_outlined,
      color: AppColors.darkBlue,
      size: 29,
    );
  }
}