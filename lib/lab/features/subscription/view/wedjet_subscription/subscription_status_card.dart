import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/subscription/model/status_model.dart';
import 'package:template/lab/features/subscription/view/wedjet_subscription/subscription_info_row.dart';


class SubscriptionStatusCard
    extends StatelessWidget {
  final LabSubscriptionStatusModel
      subscription;

  const SubscriptionStatusCard({
    super.key,
    required this.subscription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color:
            AppColors.white,
        borderRadius:
            BorderRadius.circular(18),
        border: Border.all(
          color:
              AppColors.littleBlue
                  .withOpacity(.7),
        ),
      ),
      child: Column(
        children: [
          _SubscriptionStatusHeader(
            subscription:
                subscription,
          ),

          const SizedBox(
            height: 18,
          ),

          SubscriptionInfoRow(
            title:
                'الأيام المتبقية',
            value:
                '${subscription.remainingDays} يوم',
            icon:
                Icons.hourglass_bottom_rounded,
          ),

       const SubscriptionInfoDivider(),

          if (!subscription
              .isFreeTrial) ...[
            SubscriptionInfoRow(
              title:
                  'تاريخ بداية الاشتراك',
              value:
                  _formatDate(
                subscription
                    .subscriptionStartUtc,
              ),
              icon:
                  Icons.event_available_outlined,
            ),

 const SubscriptionInfoDivider()
          ],

          SubscriptionInfoRow(
            title:
                subscription
                        .isFreeTrial
                    ? 'نهاية الفترة المجانية'
                    : 'تاريخ انتهاء الاشتراك',
            value:
                _formatDate(
              subscription
                  .subscriptionEndUtc,
            ),
            icon:
                Icons.event_outlined,
          ),

      const SubscriptionInfoDivider(),

          SubscriptionInfoRow(
            title:
                subscription
                        .isFreeTrial
                    ? 'السعر الشهري بعد الفترة المجانية'
                    : 'السعر الشهري',
            value:
              '${_formatPrice(subscription.monthlyPrice)} \$',
            icon:
                Icons.payments_outlined,
          ),
        ],
      ),
    );
  }

  String _formatDate(
    DateTime? date,
  ) {
    if (date == null) {
      return '-';
    }

    return '${date.year}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.day.toString().padLeft(2, '0')}';
  }

  String _formatPrice(
    double price,
  ) {
    if (price ==
        price.roundToDouble()) {
      return price
          .toInt()
          .toString();
    }

    return price
        .toStringAsFixed(2);
  }
}

class _SubscriptionStatusHeader
    extends StatelessWidget {
  final LabSubscriptionStatusModel
      subscription;

  const _SubscriptionStatusHeader({
    required this.subscription,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection:
          TextDirection.rtl,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration:
              BoxDecoration(
            color:
                AppColors.littleBlue
                    .withOpacity(.35),
            borderRadius:
                BorderRadius.circular(
              14,
            ),
          ),
          child: Icon(
            subscription
                    .isFreeTrial
                ? Icons
                    .card_giftcard_rounded
                : Icons
                    .workspace_premium_outlined,
            color:
                AppColors.primaryBlue,
          ),
        ),

        const SizedBox(
          width: 12,
        ),

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                subscription
                        .isFreeTrial
                    ? 'الفترة التجريبية المجانية'
                    : 'الاشتراك المدفوع',
                style: AppTextStyles
                    .ibmMedium18NeutralStyle
                    .copyWith(
                  color:
                      AppColors.darkBlue,
                  fontWeight:
                      FontWeight.w800,
                ),
              ),

              const SizedBox(
                height: 3,
              ),

              Text(
                _statusText(),
                style: AppTextStyles
                    .ibmRegular12DarkStyle
                    .copyWith(
                  color:
                      subscription
                              .isActive
                          ? AppColors.green
                          : AppColors
                              .urgentText,
                  fontWeight:
                      FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _statusText() {
    if (!subscription.isActive) {
      return 'الاشتراك منتهي';
    }

    if (subscription.isFreeTrial) {
      return 'الفترة التجريبية فعالة';
    }

    return 'الاشتراك فعال';
  }
}