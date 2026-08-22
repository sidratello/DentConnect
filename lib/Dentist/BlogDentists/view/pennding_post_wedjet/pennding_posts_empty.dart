import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';


class BlogDoctorPostsEmpty
    extends StatelessWidget {
  final VoidCallback onCreatePressed;

  const BlogDoctorPostsEmpty({
    super.key,
    required this.onCreatePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: AppColors.littleBlue
                    .withOpacity(.25),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.article_outlined,
                size: 42,
                color: AppColors.primaryBlue,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              'لا توجد منشورات',
              style: AppTextStyles
                  .ibmMedium18NeutralStyle
                  .copyWith(
                color: AppColors.darkBlue,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'لم تقم بإضافة أي منشور في هذه القائمة حتى الآن.',
              textAlign: TextAlign.center,
              style: AppTextStyles
                  .ibmRegular14NeutralStyle
                  .copyWith(
                color: AppColors.normalText,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 24),

            // AppButton(
            //   text: 'إنشاء منشور جديد',
            //   onPressed: onCreatePressed, title: '', onTap: () {  },
            // ),
          ],
        ),
      ),
    );
  }
}