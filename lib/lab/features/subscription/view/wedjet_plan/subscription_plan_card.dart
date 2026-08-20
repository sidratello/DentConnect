import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/subscription/model/price_info_model.dart';


class SubscriptionPlanCard
    extends StatelessWidget {
  final SubscriptionPriceTierModel
      plan;

  final bool selected;

  final VoidCallback onTap;

  const SubscriptionPlanCard({
    super.key,
    required this.plan,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color:
          Colors.transparent,
      child: InkWell(
        onTap:
            onTap,
        borderRadius:
            BorderRadius.circular(16),
        child: AnimatedContainer(
          duration:
              const Duration(
            milliseconds: 180,
          ),
          padding:
              const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: selected
                ? AppColors.littleBlue
                    .withOpacity(.20)
                : AppColors.white,
            borderRadius:
                BorderRadius.circular(
              16,
            ),
            border: Border.all(
              color: selected
                  ? AppColors.primaryBlue
                  : AppColors.littleBlue
                      .withOpacity(.7),
              width:
                  selected ? 1.5 : 1,
            ),
          ),
          child: Row(
            textDirection:
                ui.TextDirection.rtl,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration:
                    BoxDecoration(
                  color:
                      AppColors.littleBlue
                          .withOpacity(.35),
                  borderRadius:
                      BorderRadius.circular(
                    12,
                  ),
                ),
                child: const Icon(
                  Icons
                      .calendar_month_outlined,
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
                      CrossAxisAlignment
                          .start,
                  children: [
                    Text(
                      _monthsText(
                        plan.months,
                      ),
                      style: AppTextStyles
                          .ibmRegular14NeutralStyle
                          .copyWith(
                        color:
                            AppColors.darkBlue,
                        fontSize: 16,
                        fontWeight:
                            FontWeight.w800,
                      ),
                    ),

                    const SizedBox(
                      height: 5,
                    ),

                    Text(
                      'ينتهي في ${_formatDate(plan.newPeriodEndUtc)}',
                      style: AppTextStyles
                          .ibmRegular12DarkStyle
                          .copyWith(
                        color: AppColors
                            .normalText,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                width: 10,
              ),

              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.end,
                children: [
                  Text(
                    '${_formatPrice(plan.totalAmount)} ل.س',
                    style: AppTextStyles
                        .ibmRegular14NeutralStyle
                        .copyWith(
                      color:
                          AppColors.primaryBlue,
                      fontSize: 16,
                      fontWeight:
                          FontWeight.w800,
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  Icon(
                    selected
                        ? Icons
                            .radio_button_checked
                        : Icons
                            .radio_button_off,
                    color: selected
                        ? AppColors.primaryBlue
                        : AppColors.normalText,
                    size: 21,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _monthsText(
    int months,
  ) {
    if (months == 1) {
      return 'شهر واحد';
    }

    if (months == 2) {
      return 'شهران';
    }

    return '$months أشهر';
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

  String _formatDate(
    DateTime? date,
  ) {
    if (date == null) {
      return '-';
    }

    return DateFormat(
      'yyyy/MM/dd',
    ).format(
      date.toLocal(),
    );
  }
}