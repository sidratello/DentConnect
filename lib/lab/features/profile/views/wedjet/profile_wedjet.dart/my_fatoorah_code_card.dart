import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class MyFatoorahCodeCard
    extends StatelessWidget {
  final String code;

  const MyFatoorahCodeCard({
    super.key,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    final hasCode =
        code.trim().isNotEmpty;

    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius:
            BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.littleBlue
              .withOpacity(.55),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkBlue
                .withOpacity(.04),
            blurRadius: 14,
            offset:
                const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        textDirection:
            TextDirection.rtl,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors
                  .littleBlue
                  .withOpacity(.4),
              borderRadius:
                  BorderRadius.circular(
                13,
              ),
            ),
            child: const Icon(
              Icons
                  .account_balance_wallet_outlined,
              color:
                  AppColors.primaryBlue,
              size: 25,
            ),
          ),

          const SizedBox(width: 13),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'كود حساب المختبر',
                  textAlign:
                      TextAlign.right,
                  style: AppTextStyles
                      .ibmRegular14NeutralStyle
                      .copyWith(
                    color:
                        AppColors.darkBlue,
                    fontWeight:
                        FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  hasCode
                      ? code
                      : 'غير مضاف',
                  textAlign:
                      TextAlign.right,
                  style: AppTextStyles
                      .ibmMedium18NeutralStyle
                      .copyWith(
                    color: hasCode
                        ? AppColors
                            .primaryBlue
                        : AppColors
                            .normalText,
                    fontSize: 18,
                    fontWeight:
                        FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  'يستخدم لتحويل المدفوعات إلى حساب المختبر',
                  textAlign:
                      TextAlign.right,
                  style: AppTextStyles
                      .ibmRegular14NeutralStyle
                      .copyWith(
                    color: AppColors
                        .normalText,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}