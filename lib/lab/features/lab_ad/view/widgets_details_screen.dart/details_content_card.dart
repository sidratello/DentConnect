import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class LabAdDetailsContentCard
    extends StatelessWidget {
  final String content;

  const LabAdDetailsContentCard({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final displayedContent =
        content.trim().isEmpty
            ? 'لا يوجد محتوى مضاف لهذا الإعلان.'
            : content.trim();

    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius:
            BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.littleBlue
              .withOpacity(.7),
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch,
        children: [
          Row(
            textDirection:
                TextDirection.rtl,
            children: [
              const Icon(
                Icons
                    .description_outlined,
                color:
                    AppColors.primaryBlue,
                size: 21,
              ),
              const SizedBox(width: 7),
              Text(
                'محتوى الإعلان',
                style: AppTextStyles
                    .ibmRegular14NeutralStyle
                    .copyWith(
                  color:
                      AppColors.darkBlue,
                  fontWeight:
                      FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            displayedContent,
            textAlign: TextAlign.right,
            textDirection:
                TextDirection.rtl,
            style: AppTextStyles
                .ibmRegular14NeutralStyle
                .copyWith(
              color:
                  AppColors.textDark,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}