import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class AdTargetCard
    extends StatelessWidget {
  const AdTargetCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue
            .withOpacity(.06),
        borderRadius:
            BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.primaryBlue
              .withOpacity(.15),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue
                  .withOpacity(.12),
              borderRadius:
                  BorderRadius.circular(
                12,
              ),
            ),
            child: const Icon(
              Icons
                  .person_search_outlined,
              color:
                  AppColors.primaryBlue,
              size: 25,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'الإعلان موجه دائماً لأطباء الأسنان',
              textAlign: TextAlign.right,
              style: AppTextStyles
                  .ibmRegular14NeutralStyle
                  .copyWith(
                color:
                    AppColors.darkBlue,
                fontWeight:
                    FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}