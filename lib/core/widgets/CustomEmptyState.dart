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

  const CustomEmptyState({
    super.key,
    required this.title,
    required this.subtitle,
    // المسار الافتراضي لملف الأنيماشين في مشروعك
    this.animationPath = 'assets/animation/sad face (1).json', 
    this.animationSize = 220,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // عرض الأنيماشين بالحجم المطلوب
          Lottie.asset(
            animationPath,
            width: animationSize,
            height: animationSize,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 16),
          
          // العنوان الرئيسي - تم استخدام ibmMedium18NeutralStyle وتعديل اللون ليناسب التصميم الطبي الهادئ
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
              color: AppColors.darkBlue, // استخدام درجات الكحلي الطبية الرائعة للعنوان
            ),
          ),
          const SizedBox(height: 8),
          
          // الوصف الفرعي - تم استخدام ibmRegular14NeutralStyle وتخفيف اللون
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                color: AppColors.normalText, // استخدام لون النصوص العادية المتناسق مع تطبيقك
              ),
            ),
          ),
        ],
      ),
    );
  }
}