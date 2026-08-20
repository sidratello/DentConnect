import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class SubscriptionInfoRow
    extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const SubscriptionInfoRow({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        textDirection:
            TextDirection.rtl,
        children: [
          Icon(
            icon,
            color:
                AppColors.primaryBlue,
            size: 20,
          ),

          const SizedBox(
            width: 8,
          ),

          Expanded(
            child: Text(
              title,
              style: AppTextStyles
                  .ibmRegular14NeutralStyle
                  .copyWith(
                color:
                    AppColors.normalText,
              ),
            ),
          ),

          const SizedBox(
            width: 12,
          ),

          Flexible(
            child: Text(
              value,
              textAlign:
                  TextAlign.left,
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

class SubscriptionInfoDivider
    extends StatelessWidget {
  const SubscriptionInfoDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color:
          AppColors.littleBlue
              .withOpacity(.5),
    );
  }
}