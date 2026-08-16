import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/order_invoice/model/InvoiceItemModel.dart';


class AdInvoiceCard
    extends StatelessWidget {
  final AdInvoiceModel invoice;

  const AdInvoiceCard({
    super.key,
    required this.invoice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.all(15),
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
                .withOpacity(.05),
            blurRadius: 12,
            offset:
                const Offset(0, 5),
          ),
        ],
      ),
      child: Directionality(
        textDirection:
           ui.TextDirection.rtl,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration:
                      BoxDecoration(
                    color: AppColors
                        .littleBlue
                        .withOpacity(.35),
                    borderRadius:
                        BorderRadius.circular(
                      12,
                    ),
                  ),
                  child: const Icon(
                    Icons
                        .campaign_outlined,
                    color:
                        AppColors.primaryBlue,
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Text(
                    'فاتورة إعلان',
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
                ),

                Text(
                  '${_formatPrice(invoice.price)} ل.س',
                  style: AppTextStyles
                      .ibmRegular14NeutralStyle
                      .copyWith(
                    color:
                        AppColors.primaryBlue,
                    fontWeight:
                        FontWeight.w800,
                  ),
                ),
              ],
            ),

            if (invoice
                .adContent.isNotEmpty) ...[
              const SizedBox(
                height: 13,
              ),

              Text(
                invoice.adContent,
                textAlign:
                    TextAlign.right,
                style: AppTextStyles
                    .ibmRegular14NeutralStyle
                    .copyWith(
                  color:
                      AppColors.darkBlue,
                  height: 1.6,
                ),
              ),
            ],

            const SizedBox(height: 13),

            Divider(
              color: AppColors.littleBlue
                  .withOpacity(.5),
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                const Icon(
                  Icons
                      .check_circle_outline_rounded,
                  color:
                      AppColors.primaryBlue,
                  size: 18,
                ),

                const SizedBox(width: 6),

                Text(
                  'تم الدفع ${_formatDate(invoice.paidAt)}',
                  style: AppTextStyles
                      .ibmRegular12DarkStyle
                      .copyWith(
                    color:
                        AppColors.normalText,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
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

    return price.toStringAsFixed(2);
  }

  String _formatDate(
    DateTime? date,
  ) {
    if (date == null) {
      return 'غير محدد';
    }

    return DateFormat(
      'yyyy/MM/dd',
    ).format(
      date.toLocal(),
    );
  }
}